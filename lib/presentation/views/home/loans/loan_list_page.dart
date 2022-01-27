import 'package:boobook/models/loan.dart';
import 'package:boobook/presentation/common_widgets/book_cover.dart';
import 'package:boobook/presentation/common_widgets/empty_data.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

enum LoanSort { date, title, pupil }

/// This provider stores the way we sort the list of the loans in the view.
final loanSortProvider = StateProvider<LoanSort>(
  (_) => LoanSort.date,
);

/// This provider reads the stream from the database to get the list of the loans.
final loanListProvider = StreamProvider<List<Loan>>((ref) {
  final repository = ref.watch(loanRepositoryProvider);
  return repository.loansStream();
});

/// This provider is a workaround to avoid useless reads to the database.
/// If we pass the [LoanSort] to [LoanRepository.loansStream], we could avoid
/// this provider but each time the user changes the sort parameter, it makes
/// a new query to Firestore and it leads to more reads (so more billing)
/// and also a fast loading screen while the new query is processed.
/// So by storing the list in a provider and the sorted list in another one, we do not
/// request the database each time we sort the list by a new parameter.
final sortedLoanListProvider =
    Provider.family<AsyncValue<List<Loan>>, LoanSort>((ref, sortBy) {
  return ref.watch(loanListProvider).whenData((loans) {
    switch (sortBy) {
      case LoanSort.date:
        loans.sort((a, b) {
          if (a.returnDate != null && b.returnDate != null) {
            return a.returnDate!.compareTo(b.returnDate!);
          } else if (a.returnDate != null && b.returnDate == null) {
            return 1;
          } else {
            return a.expectedReturnDate.compareTo(b.expectedReturnDate);
          }
        });
        break;
      case LoanSort.title:
        loans.sort((a, b) => a.book!.title.compareTo(b.book!.title));
        break;
      case LoanSort.pupil:
        loans.sort(
            (a, b) => a.pupil!.displayName.compareTo(b.pupil!.displayName));
        break;
    }
    return loans;
  });
});

class LoanListPage extends ConsumerWidget {
  const LoanListPage({Key? key}) : super(key: key);

  void _openMenu(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    showPlatformPopupMenu(
      context: context,
      title: l10n.loanSort,
      ref: ref,
      items: [
        PlatformPopupMenuItem(
          title: l10n.sortByReturnDate,
          value: LoanSort.date,
        ),
        PlatformPopupMenuItem(
          title: l10n.sortByTitle,
          value: LoanSort.title,
        ),
        PlatformPopupMenuItem(
          title: l10n.sortByPupil,
          value: LoanSort.pupil,
        ),
      ],
      onPressed: (sortBy) {
        if (sortBy != null) {
          ref.read(loanSortProvider.state).state = sortBy;
        }
      },
    );
  }

  _addLoan(WidgetRef ref) {
    final id = ref.read(loanRepositoryProvider).newDocumentId;
    final navigator = NavigatorKeys.main.currentState!;
    navigator.pushNamed(AppRoutes.loanFormNavigator(id));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: l10n.loanListTitle,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCupertino())
              PlatformNavigationBarButton(
                icon: PlatformIcons.add,
                onPressed: () => _addLoan(ref),
              ),
            PlatformNavigationBarButton(
              icon: Icons.sort,
              onPressed: () => _openMenu(context, ref),
            ),
          ],
        ),
      ),
      body: const LoanListPageContents(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => _addLoan(ref),
            tooltip: l10n.scanBarcode,
            child: Icon(Icons.add, size: 30),
            heroTag: null,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              final navigator = NavigatorKeys.main.currentState!;
              navigator.pushNamed(AppRoutes.scanPage);
            },
            tooltip: l10n.scanBarcode,
            child: Icon(CupertinoIcons.barcode_viewfinder, size: 36),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}

class LoanListPageContents extends ConsumerWidget {
  const LoanListPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortBy = ref.watch(loanSortProvider.state).state;
    final loans = ref.watch(sortedLoanListProvider(sortBy));
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);

    return loans.when(
      loading: () => const Center(
        child: Center(
          child: PlatformActivityIndicator(),
        ),
      ),
      error: (error, _) {
        return Center(child: Text(error.toString()));
      },
      data: (data) {
        if (data.isEmpty) {
          return EmptyData(l10n.loanEmptyCaption);
        }
        return Container(
          color: appTheme.listTileBackground,
          child: ProviderScope(
            overrides: [
              listViewThemeProvider.overrideWithValue(
                listViewTheme.copyWith(separatorPadding: 55.0),
              ),
            ],
            child: PlatformListView(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ProviderScope(
                  overrides: [
                    _currentLoan.overrideWithValue(data[index]),
                  ],
                  child: const _LoanItem(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

final _currentLoan = Provider<Loan>((ref) {
  throw UnimplementedError();
});

enum LoanAction { returned, lost, cancel }

class _LoanItem extends ConsumerWidget {
  const _LoanItem({Key? key}) : super(key: key);

  Future<void> _handle(WidgetRef ref, LoanAction action) async {
    final repository = ref.watch(loanRepositoryProvider);
    final loan = ref.watch(_currentLoan);

    switch (action) {
      case LoanAction.returned:
        repository.set(loan.copyWith(returnDate: DateTime.now()));
        break;
      case LoanAction.lost:
        repository.set(loan.copyWith(isLost: true));
        break;
      case LoanAction.cancel:
        repository.delete(loan);
        break;
    }
  }

  void _showModalSheet(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final loan = ref.watch(_currentLoan);
    showPlatformModalSheet(
      context: context,
      ref: ref,
      title: loan.book!.title,
      actions: [
        PlatformModalSheetAction(
          title: l10n.loanActionReturn,
          icon: Icons.check,
          onPressed: () => _handle(ref, LoanAction.returned),
        ),
        PlatformModalSheetAction(
          title: l10n.loanActionEdit,
          icon: Icons.edit,
          onPressed: () {
            final navigator = NavigatorKeys.loans.currentState!;
            navigator.pushNamed(AppRoutes.loanFormPage(loan.id!));
          },
        ),
        PlatformModalSheetAction(
          title: l10n.loanActionCancel,
          icon: Icons.close,
          onPressed: () => _handle(ref, LoanAction.cancel),
        ),
        PlatformModalSheetAction(
          title: l10n.loanActionLost,
          icon: Icons.delete,
          onPressed: () => _handle(ref, LoanAction.lost),
          isDestructiveAction: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final loan = ref.watch(_currentLoan);

    return PlatformListTile(
      leading: BookCover(book: loan.book!),
      label: loan.book!.title,
      caption: l10n.loanedTo(loan.pupil!.displayName),
      trailing: const _LoanExpectedReturn(),
      onTap: () {
        _showModalSheet(context, ref);
      },
    );
  }
}

class _LoanExpectedReturn extends ConsumerWidget {
  const _LoanExpectedReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final loan = ref.watch(_currentLoan);
    final daysLeft = loan.expectedReturnDate.difference(DateTime.now()).inDays;
    final textColor = (daysLeft <= 0
        ? Colors.red
        : (daysLeft < 4 ? Colors.orange : Colors.green));

    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: (() {
        if (loan.returnDate != null) {
          return Icon(PlatformIcons.checkmark, color: Colors.green, size: 28);
        } else if (loan.isLost) {
          return Icon(Icons.close, color: Colors.red, size: 28);
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (daysLeft < 0)
                Text(l10n.loanReturnLate,
                    style: TextStyle(fontSize: 10, color: textColor)),
              if (daysLeft == 0 || daysLeft == 1)
                Text(l10n.loanReturn,
                    style: TextStyle(fontSize: 10, color: textColor)),
              if (daysLeft > 1)
                Text(l10n.loanReturnIn,
                    style: TextStyle(fontSize: 10, color: textColor)),
              if (daysLeft == 0)
                Text(l10n.today,
                    style: TextStyle(fontSize: 18, color: textColor)),
              if (daysLeft != 0)
                Text(
                    daysLeft == 1
                        ? l10n.tomorrow
                        : l10n.loanReturnDays(
                            daysLeft.abs().toString(),
                          ),
                    style: TextStyle(fontSize: 18, color: textColor)),
            ],
          );
        }
      }()),
    );
  }
}
