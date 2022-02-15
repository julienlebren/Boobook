import 'package:avatar/avatar.dart';
import 'package:boobook/models/book.dart';
import 'package:boobook/models/loan.dart';
import 'package:boobook/presentation/common_widgets/empty_data.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/presentation/theme/theme.dart';
import 'package:boobook/presentation/views/home/books/book_list_page.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

enum BookMenuActions { edit, archive }

/// A provider that returns the selected [Book] from its id.
/// The list is fetched with a !, which usually can lead to some fatal
/// error but in this case, the list has already been fetched in the previous
/// page so it can't lead to a fatal error here.
final bookProvider = Provider.autoDispose.family<Book, String>((ref, id) {
  final bookList = ref.watch(bookListProvider).asData!.value;
  return bookList.where((book) => book.id == id).first;
});

final bookLoansProvider =
    StreamProvider.family.autoDispose<List<Loan>, String>((ref, bookId) {
  final repository = ref.watch(loanRepositoryProvider);
  return repository.bookLoans(bookId);
});

class BookDetailsPage extends ConsumerWidget {
  const BookDetailsPage({Key? key}) : super(key: key);

  void _openMenu(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedBookId);
    final l10n = ref.watch(localizationProvider);

    showPlatformPopupMenu(
      context: context,
      ref: ref,
      items: [
        PlatformPopupMenuItem(
          title: l10n.bookActionEdit,
          icon: PlatformIcons.settings,
          value: BookMenuActions.edit,
        ),
        PlatformPopupMenuItem(
          title: l10n.bookActionDelete,
          icon: Icons.archive,
          value: BookMenuActions.archive,
          isDestructiveAction: true,
        ),
      ],
      onPressed: (value) {
        switch (value) {
          case BookMenuActions.edit:
            _edit(id);
            break;
          case BookMenuActions.archive:
            _archive(ref, id);
            break;
        }
      },
    );
  }

  Future<void> _edit(String id) async {
    final navigator = AppRouter.main.currentState!;
    navigator.pushNamed(AppRouter.bookFormPage(id));
  }

  Future<void> _archive(WidgetRef ref, String id) async {
    final repository = ref.read(bookRepositoryProvider);
    final book = ref.read(bookProvider(id));
    await repository.set(book.copyWith(isArchived: true));

    final navigator = AppRouter.books.currentState!;
    navigator.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedBookId);
    final book = ref.watch(bookProvider(id));

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: book.title,
        trailing: PlatformNavigationBarButton(
          icon: PlatformIcons.more,
          onPressed: () => _openMenu(context, ref),
        ),
      ),
      body: const BookDetailsPageContents(),
    );
  }
}

class BookDetailsPageContents extends ConsumerWidget {
  const BookDetailsPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedBookId);
    final book = ref.watch(bookProvider(id));
    final loans = ref.watch(bookLoansProvider(id));
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);

    return ProviderScope(
      overrides: [
        listViewThemeProvider.overrideWithValue(
          listViewTheme.copyWith(separatorPadding: 65.0),
        ),
      ],
      child: Container(
        color: appTheme.listTileBackground,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 6),
            ),
            if (book.totalLoans == 0)
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  // TODO: 160: better handle the height of navbar and bottom bar
                  height: MediaQuery.of(context).size.height - 160,
                  child: EmptyData(l10n.bookNeverLent),
                ),
              ),
            if (book.totalLoans > 0) ...[
              if (loans.asData == null)
                SliverToBoxAdapter(
                  child: Center(
                    child: PlatformActivityIndicator(),
                  ),
                ),
              if (loans.asData != null) ...[
                if (!book.isAvailable) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        l10n.bookCurrentLoan,
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
                        return SliverToBoxAdapter(
                          child: ProviderScope(
                            overrides: [
                              _currentLoan.overrideWithValue(_loans.first),
                            ],
                            child: const _LoanItem(),
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
                if (book.totalLoans > 0) ...[
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
      leading: Avatar(
        name: loan.pupil!.displayName,
        color: loan.pupil!.color,
        radius: 20,
      ),
      label: loan.pupil!.displayName,
      caption: loan.dates(context, ref),
    );
  }
}
