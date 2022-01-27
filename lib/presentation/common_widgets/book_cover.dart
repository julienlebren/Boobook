import 'package:boobook/core/models/book.dart';
import 'package:boobook/common_providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart'
    show PlatformActivityIndicator;

class BookCover extends ConsumerWidget {
  const BookCover({
    Key? key,
    required this.book,
    this.width = 30,
    this.height = 40,
  }) : super(key: key);

  final Book book;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    return Container(
      width: width,
      height: height,
      child: (() {
        if (book.imageUrl != null) {
          return CachedNetworkImage(
            imageUrl: book.imageUrl!,
            placeholder: (context, url) => SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: const PlatformActivityIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.no_photography_outlined,
                  size: width > 30 ? width / 4 : width,
                  color: Colors.grey,
                ),
                if (width > 30) ...[
                  SizedBox(height: 12),
                  Text(
                    l10n.bookCoverPlaceholder,
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          );
        }
      }()),
    );
  }
}
