import 'package:boobook/providers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:layout_builder/layout_builder.dart';

class BookAvailability extends ConsumerWidget {
  const BookAvailability({
    Key? key,
    required this.isAvailable,
    this.expectedReturnTime,
  })  : assert(isAvailable || (!isAvailable && expectedReturnTime != null)),
        super(key: key);

  final bool isAvailable;
  final DateTime? expectedReturnTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: isAvailable ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10),
          Text(
            isAvailable
                ? l10n.bookAvailable
                : l10n.bookExpectedReturn(
                    DateFormat.yMMMMd().format(expectedReturnTime!)),
            style: PlatformTextStyle.n15.copyWith(
              color: isAvailable ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
