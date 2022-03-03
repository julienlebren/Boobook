import 'package:boobook/models/loan.dart';
import 'package:boobook/models/pupil.dart';
import 'package:boobook/presentation/common_widgets/book_cover.dart';
import 'package:boobook/presentation/common_widgets/empty_data.dart';
import 'package:boobook/presentation/common_widgets/pupil_card.dart';
import 'package:boobook/presentation/theme/theme.dart';
import 'package:boobook/presentation/views/home/pupils/pupil_list_page.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/presentation/router/router.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

enum PupilMenuActions { edit, card, archive }

final pupilProvider = Provider.family.autoDispose<Pupil, String>((ref, id) {
  final pupilList = ref.watch(pupilListProvider).asData!.value;
  final filteredList = pupilList.where((pupil) => pupil.id == id);

  if (filteredList.isEmpty) {
    return Pupil.create(id: id);
  } else {
    return filteredList.first;
  }
});

final pupilLoansProvider =
    StreamProvider.family.autoDispose<List<Loan>, String>((ref, pupilId) {
  final repository = ref.watch(loanRepositoryProvider);
  return repository.pupilLoans(pupilId);
});

class PupilDetailsPage extends ConsumerWidget {
  const PupilDetailsPage({Key? key}) : super(key: key);

  void _openMenu(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedPupilId)!;
    final l10n = ref.watch(localizationProvider);

    showPlatformPopupMenu(
      context: context,
      ref: ref,
      items: [
        PlatformPopupMenuItem(
          title: l10n.pupilActionEdit,
          icon: PlatformIcons.settings,
          value: PupilMenuActions.edit,
        ),
        PlatformPopupMenuItem(
          title: l10n.pupilActionExportCard,
          icon: CupertinoIcons.barcode,
          value: PupilMenuActions.card,
        ),
        PlatformPopupMenuItem(
          title: l10n.pupilActionArchive,
          icon: Icons.archive,
          value: PupilMenuActions.archive,
          isDestructiveAction: true,
        ),
      ],
      onPressed: (value) {
        switch (value) {
          case PupilMenuActions.edit:
            _edit(id);
            break;
          case PupilMenuActions.card:
            _print(ref, id);
            break;
          case PupilMenuActions.archive:
            _archive(ref, id);
            break;
        }
      },
    );
  }

  Future<void> _edit(String id) async {
    final navigator = AppRouter.main.currentState!;
    navigator.pushNamed(AppRouter.pupilFormPage(id));
  }

  Future<void> _archive(WidgetRef ref, String id) async {
    final repository = ref.read(pupilRepositoryProvider);
    final pupil = ref.read(pupilProvider(id));
    await repository.set(pupil.copyWith(isArchived: true));

    final navigator = AppRouter.pupils.currentState!;
    navigator.pop();
  }

  Future<void> _print(WidgetRef ref, String id) async {
    final l10n = ref.watch(localizationProvider);
    final pupil = ref.read(pupilProvider(id));
    final user = ref.watch(userProvider)!;

    final card = await PupilCard.generate(
      pupil,
      title: user.cardTitle ?? l10n.pupilCardTitle,
      subtitle: l10n.pupilCardSubitle,
    );

    final doc = pw.Document();
    doc.addPage(card);

    await Printing.sharePdf(
        bytes: await doc.save(),
        filename: "${pupil.displayName}-${pupil.id}.pdf");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedPupilId)!;
    final pupil = ref.watch(pupilProvider(id));

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: pupil.displayName,
        trailing: PlatformNavigationBarButton(
          icon: PlatformIcons.more,
          onPressed: () => _openMenu(context, ref),
        ),
      ),
      body: const PupilDetailsPageContents(),
    );
  }
}

class PupilDetailsPageContents extends ConsumerWidget {
  const PupilDetailsPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedPupilId)!;
    final pupil = ref.watch(pupilProvider(id));
    final loans = ref.watch(pupilLoansProvider(id));
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);

    return ProviderScope(
      overrides: [
        listViewThemeProvider.overrideWithValue(
          listViewTheme.copyWith(separatorPadding: 55.0),
        ),
      ],
      child: Container(
        color: appTheme.listTileBackground,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 6),
            ),
            if (pupil.totalLoans == 0)
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  // TODO: 160: better handle the height of navbar and bottom bar
                  height: MediaQuery.of(context).size.height - 160,
                  child: EmptyData(l10n.pupilNoLoan),
                ),
              ),
            if (pupil.totalLoans > 0) ...[
              if (loans.asData == null)
                SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (loans.asData != null) ...[
                if (pupil.currentLoans > 0) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        l10n.pupilCurrentLoans(pupil.currentLoans.toString()),
                        style: sectionHeaderStyle.copyWith(
                          color: appTheme.textColor,
                        ),
                      ),
                    ),
                  ),
                  loans.maybeWhen(
                    data: (loans) {
                      final _loans = loans
                          .where((loan) => loan.returnDate == null)
                          .toList();

                      if (_loans.isNotEmpty) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (index.isOdd) {
                                return isCupertino()
                                    ? const ListDivider()
                                    : SizedBox.shrink();
                              }
                              return ProviderScope(
                                overrides: [
                                  _currentLoan.overrideWithValue(
                                    _loans[index ~/ 2],
                                  ),
                                ],
                                child: const _LoanItem(),
                              );
                            },
                            childCount: (_loans.length * 2) - 1,
                          ),
                        );
                      } else {
                        return SliverToBoxAdapter();
                      }
                    },
                    orElse: () => SliverToBoxAdapter(),
                  ),
                  SliverToBoxAdapter(
                    child: isCupertino()
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              color: appTheme.dividerColor,
                              height: 0.5,
                            ),
                          )
                        : const FormSectionDivider(),
                  ),
                ],
                if (pupil.totalLoans > 0) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        l10n.bookLoanHistory,
                        style: sectionHeaderStyle.copyWith(
                          color: appTheme.textColor,
                        ),
                      ),
                    ),
                  ),
                  loans.maybeWhen(
                    data: (loans) {
                      final _loans = loans
                          .where((loan) => loan.returnDate != null)
                          .toList();

                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index.isOdd) {
                              return isCupertino()
                                  ? const ListDivider()
                                  : SizedBox.shrink();
                            }
                            return ProviderScope(
                              overrides: [
                                _currentLoan.overrideWithValue(
                                  _loans[index ~/ 2],
                                ),
                              ],
                              child: const _LoanItem(),
                            );
                          },
                          childCount: (_loans.length * 2) - 1,
                        ),
                      );
                    },
                    orElse: () => SliverToBoxAdapter(),
                  ),
                ],
              ],
            ],
          ],
        ),
      ),
    );
  }
}

final _currentLoan = Provider<Loan>((ref) {
  throw UnimplementedError();
});

class _LoanItem extends ConsumerWidget {
  const _LoanItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loan = ref.watch(_currentLoan);

    return PlatformListTile(
      leading: BookCover(book: loan.book!),
      label: loan.book!.title,
      caption: loan.dates(context, ref),
    );
  }
}
