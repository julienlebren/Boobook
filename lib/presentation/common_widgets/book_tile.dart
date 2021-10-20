import 'package:boobook/presentation/common_widgets/book_cover.dart';
import 'package:boobook/providers/books.dart';
import 'package:boobook/providers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final bookAvailableProvider = Provider<bool>((_) => true);

class BookTile extends ConsumerWidget {
  const BookTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedBookId)!;
    final book = ref.watch(bookProvider(id));
    final displayAvailable = ref.watch(bookAvailableProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(
            book: book,
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  book.datePublished != null
                      ? "${DateFormat.y().format(book.datePublished!)}, ${book.publisher}"
                      : book.publisher != null
                          ? book.publisher!
                          : "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                if (displayAvailable)
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: book.isAvailable ? Colors.green : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                          book.isAvailable
                              ? l10n.bookAvailable
                              : l10n.bookUnavailable,
                          style: TextStyle(
                              color: book.isAvailable
                                  ? Colors.green
                                  : Colors.red)),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
