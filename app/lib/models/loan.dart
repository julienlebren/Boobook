import 'package:boobook/models/book.dart';
import 'package:boobook/models/pupil.dart';
import 'package:boobook/common_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan.freezed.dart';
part 'loan.g.dart';

@freezed
class Loan with _$Loan {
  @JsonSerializable(explicitToJson: true)
  factory Loan({
    String? id,
    Pupil? pupil,
    Book? book,
    bool? isNewLoan,
    @Default(false) bool isLost,
    @TimestampConverter() required DateTime loanDate,
    @TimestampConverter() required DateTime expectedReturnDate,
    @NullableTimestampConverter() DateTime? returnDate,
  }) = _Loan;

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);

  factory Loan.create({
    required String id,
    Book? book,
    Pupil? pupil,
  }) =>
      Loan(
        id: id,
        isNewLoan: true,
        loanDate: DateTime.now(),
        expectedReturnDate: DateTime.now().add(const Duration(days: 14)),
        book: book,
        pupil: pupil,
      );
}

extension LoanX on Loan {
  String dates(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    if (returnDate != null) {
      return l10n.bookLoanFromTo(
          loanDate.toLocaleDate(context), returnDate!.toLocaleDate(context));
    } else if (isLost) {
      return l10n.bookLost;
    } else {
      return l10n.bookLoanSince(loanDate.toLocaleDate(context));
    }
  }
}
