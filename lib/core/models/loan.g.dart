// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Loan _$$_LoanFromJson(Map<String, dynamic> json) => _$_Loan(
      id: json['id'] as String?,
      pupil: json['pupil'] == null
          ? null
          : Pupil.fromJson(json['pupil'] as Map<String, dynamic>),
      book: json['book'] == null
          ? null
          : Book.fromJson(json['book'] as Map<String, dynamic>),
      isNewLoan: json['isNewLoan'] as bool?,
      isLost: json['isLost'] as bool? ?? false,
      loanDate:
          const TimestampConverter().fromJson(json['loanDate'] as Timestamp),
      expectedReturnDate: const TimestampConverter()
          .fromJson(json['expectedReturnDate'] as Timestamp),
      returnDate: const NullableTimestampConverter()
          .fromJson(json['returnDate'] as Timestamp?),
    );

Map<String, dynamic> _$$_LoanToJson(_$_Loan instance) => <String, dynamic>{
      'id': instance.id,
      'pupil': instance.pupil?.toJson(),
      'book': instance.book?.toJson(),
      'isNewLoan': instance.isNewLoan,
      'isLost': instance.isLost,
      'loanDate': const TimestampConverter().toJson(instance.loanDate),
      'expectedReturnDate':
          const TimestampConverter().toJson(instance.expectedReturnDate),
      'returnDate':
          const NullableTimestampConverter().toJson(instance.returnDate),
    };
