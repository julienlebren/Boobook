import 'package:boobook/core/models/book.dart';
import 'package:boobook/presentation/common_widgets/book_cover.dart';
import 'package:boobook/presentation/common_widgets/empty_data.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

enum BookSort { title, available }

/// A class that handles the arguments to filter the book list
class BookFilters {
  final String? title;
  final String? magazineBarCode;
  final BookSort sortBy;

  BookFilters(this.title, this.magazineBarCode, this.sortBy);
}

/// This provider stores the way we sort the list of the books in the view.
final bookSortProvider = StateProvider<BookSort>(
  (_) => BookSort.title,
);

final magazineProvider = Provider.autoDispose<String?>((_) => null);
final bookTitleProvider = StateProvider<String?>((_) => null);

/// This provider reads the stream from the database to get the list of the books.
final bookListProvider = StreamProvider<List<Book>>((ref) {
  final repository = ref.watch(bookRepositoryProvider);
  return repository.booksStream();
});

/// This provider is a workaround to avoid useless reads to the database.
/// If we pass the sortBy method to [PupilRepository.pupilsStream], we could avoid
/// this provider but each time the user changes the sort method, but it leads to
/// more reads of the database (so more billing) and also a fast loading screen
/// while the new sort is processed.
/// So by storing the list in a provider and the sorted list in another one, we do not
/// request the database each time we sort the list by a new parameter.
final filteredBookListProvider = Provider.autoDispose
    .family<AsyncValue<List<Book>>, BookFilters>((ref, filters) {
  return ref.watch(bookListProvider).whenData((books) {
    if (filters.magazineBarCode != null) {
      books = books
          .where((book) => book.isbn13 == filters.magazineBarCode)
          .toList();
    }
    if (filters.title != null) {
      books = books
          .where((book) =>
              book.title.contains(RegExp(filters.title!, caseSensitive: false)))
          .toList();
    }

    switch (filters.sortBy) {
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
  final String? magazineBarCode;
  final Function(Book book) onBookChanged;
  final bool isPicker;

  BookPageArguments({
    this.bookId,
    this.magazineBarCode,
    required this.onBookChanged,
    this.isPicker = false,
  });
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
        hasBorder: isMaterial(),
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
      body: Column(
        children: [
          if (isCupertino()) ...[
            BookListSearchBar(),
            CupertinoNavigationBarBorder(),
          ],
          Expanded(
            child: const BookListPageContents(),
          ),
        ],
      ),
      floatingActionButton: isPicker
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () => _addBook(ref),
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
      isModal: isPicker,
    );
  }
}

class BookListSearchBar extends ConsumerStatefulWidget {
  @override
  createState() => _BookListSearchBarState();
}

class _BookListSearchBarState extends ConsumerState<BookListSearchBar> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () {
      textController.addListener(() {
        ref.read(bookTitleProvider.state).state =
            textController.text != "" ? textController.text : null;
      });
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.read(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);

    return Container(
      color: appTheme.cupertinoNavigationBarBackgroundColor,
      child: PlatformSearchBar(
        controller: textController,
        focusNode: focusNode,
        placeholder: l10n
            .bookSearchPlaceholder, //isCupertino() ? l10n.searchHint : l10n.schoolsTitle,
      ),
    );
  }
}

class BookListPageContents extends ConsumerWidget {
  const BookListPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPicker = ref.watch(pickerProvider);
    final sortBy = ref.watch(bookSortProvider);
    final magazineBarCode = ref.watch(magazineProvider);
    final bookTitle = ref.watch(bookTitleProvider);

    final filters = BookFilters(bookTitle, magazineBarCode, sortBy);

    final books = ref.watch(filteredBookListProvider(filters));
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);

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
          return EmptyData(
              bookTitle != null ? l10n.bookNoResult : l10n.bookEmptyCaption);
        }
        return Container(
          color: appTheme.listTileBackground,
          child: ProviderScope(
            overrides: [
              listViewThemeProvider.overrideWithValue(
                listViewTheme.copyWith(separatorPadding: 56.0),
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

/// A provider that needs to be scoped with the callback that
/// will be used when the user selects a book in the list.
final bookHandler = Provider<Function(Book)>(
  (ref) => ((Book book) {
    final navigator = NavigatorKeys.books.currentState!;
    navigator.pushNamed(AppRoutes.bookDetailsPage(book.id!));
  }),
);

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
