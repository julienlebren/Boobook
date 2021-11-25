import 'package:boobook/core/models/book.dart';
import 'package:boobook/presentation/common_widgets/book_cover.dart';
import 'package:boobook/presentation/common_widgets/empty_data.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/providers/books.dart';
import 'package:boobook/providers/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

enum BookSort { title, available }

/// This provider stores the way we sort the list of the books in the view.
final bookSortProvider = StateProvider.autoDispose<BookSort>(
  (_) => BookSort.title,
);

/// This provider is a workaround to avoid useless reads to the database.
/// If we pass the sortBy method to [PupilRepository.pupilsStream], we could avoid
/// this provider but each time the user changes the sort method, but it leads to
/// more reads of the database (so more billing) and also a fast loading screen
/// while the new sort is processed.
/// So by storing the list in a provider and the sorted list in another one, we do not
/// request the database each time we sort the list by a new parameter.
final sortedPupilListProvider = Provider.family
    .autoDispose<AsyncValue<List<Book>>, BookSort>((ref, sortBy) {
  return ref.watch(bookListProvider).whenData((books) {
    switch (sortBy) {
      case BookSort.title:
        books.sort((a, b) => b.title.compareTo(a.title));
        break;
      case BookSort.available:
        books.sort((a, b) => a.isAvailable.compareTo(b.isAvailable));
        break;
    }
    return books;
  });
});

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
          final navigator = NavigatorKeys.main.currentState!;
          navigator.pop(context);
          ref.read(bookSortProvider.state).state = sortBy;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: l10n.bookListTitle,
        trailing: PlatformNavigationBarButton(
          icon: Icons.sort,
          onPressed: () => _openMenu(context, ref),
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
    );
  }
}

class BooksOverviewPageContents extends ConsumerWidget {
  const BooksOverviewPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookListProvider);
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);

    return books.when(
      loading: () => const Center(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) {
        return Center(child: Text(error.toString()));
      },
      data: (data) {
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

    return PlatformListTile(
      leading: BookCover(book: book),
      label: book.title,
      trailing: Padding(
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
        final navigator = NavigatorKeys.books.currentState!;
        navigator.pushNamed(AppRoutes.bookDetailsPage(book.id!));
      },
    );
  }
}
