import 'package:boobook/core/models/book.dart';
import 'package:boobook/presentation/common_widgets/book_cover.dart';
import 'package:boobook/presentation/common_widgets/empty_data.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/providers/books.dart';
import 'package:boobook/providers/common.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

enum BookSort { title, available }

/// This provider stores the way we sort the list of the books in the view.
final bookSortProvider = StateProvider<BookSort>(
  (_) => BookSort.title,
);

/// This provider is a workaround to avoid useless reads to the database.
/// If we pass the sortBy method to [PupilRepository.pupilsStream], we could avoid
/// this provider but each time the user changes the sort method, but it leads to
/// more reads of the database (so more billing) and also a fast loading screen
/// while the new sort is processed.
/// So by storing the list in a provider and the sorted list in another one, we do not
/// request the database each time we sort the list by a new parameter.
final sortedBookListProvider =
    Provider.family<AsyncValue<List<Book>>, BookSort>((ref, sortBy) {
  return ref.watch(bookListProvider).whenData((books) {
    switch (sortBy) {
      case BookSort.title:
        books.sort((a, b) => a.title.compareTo(b.title));
        break;
      case BookSort.available:
        books.sort((b, a) => (a.isAvailable == true ? 1 : 0)
            .compareTo((b.isAvailable == true ? 1 : 0)));
        break;
    }
    return books;
  });
});

/// A class that handles the arguments passed to the navigator
class BookPageArguments {
  final String? bookId;
  final Function(Book book) onBookChanged;
  final bool isPicker;

  BookPageArguments(this.bookId, this.onBookChanged, this.isPicker);
}

class BookListPage extends ConsumerWidget {
  const BookListPage({Key? key}) : super(key: key);

  void _openMenu(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    showPlatformPopupMenu(
      context: context,
      title: l10n.bookSort,
      ref: ref,
      items: [
        PlatformPopupMenuItem(
          title: l10n.sortByTitle,
          value: BookSort.title,
        ),
        PlatformPopupMenuItem(
          title: l10n.sortByAvailability,
          value: BookSort.available,
        ),
      ],
      onPressed: (sortBy) {
        if (sortBy != null) {
          ref.read(bookSortProvider.state).state = sortBy;
        }
      },
    );
  }

  _addBook(WidgetRef ref) {
    final id = ref.read(bookRepositoryProvider).newDocumentId;
    final navigator = NavigatorKeys.main.currentState!;
    navigator.pushNamed(AppRoutes.bookFormPage(id));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final isPicker = ref.watch(pickerProvider);

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: isPicker ? l10n.bookPickerTitle : l10n.bookListTitle,
        leading: isPicker
            ? PlatformNavigationBarCloseButton(
                onPressed: () {
                  final navigator = NavigatorKeys.main.currentState!;
                  navigator.pop();
                },
              )
            : null,
        trailing: isPicker
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isCupertino())
                    PlatformNavigationBarButton(
                      icon: PlatformIcons.add,
                      onPressed: () => _addBook(ref),
                    ),
                  PlatformNavigationBarButton(
                    icon: Icons.sort,
                    onPressed: () => _openMenu(context, ref),
                  ),
                ],
              ),
      ),
      body: const BooksOverviewPageContents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final navigator = NavigatorKeys.main.currentState!;
          navigator.pushNamed(AppRoutes.scanPage);
        },
        tooltip: l10n.scanBarcode,
        child: Icon(CupertinoIcons.barcode_viewfinder, size: 36),
        heroTag: null,
      ),
      isModal: isPicker,
    );
  }
}

class BooksOverviewPageContents extends ConsumerWidget {
  const BooksOverviewPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPicker = ref.watch(pickerProvider);
    final sortBy = ref.watch(bookSortProvider);
    final books = ref.watch(sortedBookListProvider(sortBy));
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);

    return books.when(
      loading: () => const Center(
        child: Center(
          child: PlatformActivityIndicator(),
        ),
      ),
      error: (error, _) {
        return Center(child: Text(error.toString()));
      },
      data: (data) {
        if (isPicker) {
          data = data.where((book) => book.isAvailable == true).toList();
        }

        if (data.isEmpty) {
          return EmptyData(l10n.bookEmptyCaption);
        }
        return Container(
          color: appTheme.listTileBackground,
          child: ProviderScope(
            overrides: [
              listViewThemeProvider.overrideWithValue(
                ListViewTheme(separatorPadding: 56.0),
              ),
            ],
            child: PlatformListView(
              isModal: isPicker,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ProviderScope(
                  overrides: [
                    _currentBook.overrideWithValue(data[index]),
                  ],
                  child: const _BookItem(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

final _currentBook = Provider<Book>((ref) {
  throw UnimplementedError();
});

class _BookItem extends ConsumerWidget {
  const _BookItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(_currentBook);
    final isPicker = ref.watch(pickerProvider);

    return PlatformListTile(
      leading: BookCover(book: book),
      label: book.title,
      trailing: isPicker
          ? null
          : Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: book.isAvailable ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
      onTap: () {
        ref.read(bookHandler)(book);
      },
    );
  }
}
