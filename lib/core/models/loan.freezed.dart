// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Loan _$LoanFromJson(Map<String, dynamic> json) {
  return _Loan.fromJson(json);
}

/// @nodoc
class _$LoanTearOff {
  const _$LoanTearOff();

  _Loan call(
      {String? id,
      Pupil? pupil,
      Book? book,
      bool? isNewLoan,
      bool isLost = false,
      @TimestampConverter() required DateTime loanDate,
      @TimestampConverter() required DateTime expectedReturnDate,
      @NullableTimestampConverter() DateTime? returnDate}) {
    return _Loan(
      id: id,
      pupil: pupil,
      book: book,
      isNewLoan: isNewLoan,
      isLost: isLost,
      loanDate: loanDate,
      expectedReturnDate: expectedReturnDate,
      returnDate: returnDate,
    );
  }

  Loan fromJson(Map<String, Object?> json) {
    return Loan.fromJson(json);
  }
}

/// @nodoc
const $Loan = _$LoanTearOff();

/// @nodoc
mixin _$Loan {
  String? get id => throw _privateConstructorUsedError;
  Pupil? get pupil => throw _privateConstructorUsedError;
  Book? get book => throw _privateConstructorUsedError;
  bool? get isNewLoan => throw _privateConstructorUsedError;
  bool get isLost => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get loanDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get expectedReturnDate => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get returnDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoanCopyWith<Loan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanCopyWith<$Res> {
  factory $LoanCopyWith(Loan value, $Res Function(Loan) then) =
      _$LoanCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      Pupil? pupil,
      Book? book,
      bool? isNewLoan,
      bool isLost,
      @TimestampConverter() DateTime loanDate,
      @TimestampConverter() DateTime expectedReturnDate,
      @NullableTimestampConverter() DateTime? returnDate});

  $PupilCopyWith<$Res>? get pupil;
  $BookCopyWith<$Res>? get book;
}

/// @nodoc
class _$LoanCopyWithImpl<$Res> implements $LoanCopyWith<$Res> {
  _$LoanCopyWithImpl(this._value, this._then);

  final Loan _value;
  // ignore: unused_field
  final $Res Function(Loan) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? pupil = freezed,
    Object? book = freezed,
    Object? isNewLoan = freezed,
    Object? isLost = freezed,
    Object? loanDate = freezed,
    Object? expectedReturnDate = freezed,
    Object? returnDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      pupil: pupil == freezed
          ? _value.pupil
          : pupil // ignore: cast_nullable_to_non_nullable
              as Pupil?,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book?,
      isNewLoan: isNewLoan == freezed
          ? _value.isNewLoan
          : isNewLoan // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLost: isLost == freezed
          ? _value.isLost
          : isLost // ignore: cast_nullable_to_non_nullable
              as bool,
      loanDate: loanDate == freezed
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedReturnDate: expectedReturnDate == freezed
          ? _value.expectedReturnDate
          : expectedReturnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      returnDate: returnDate == freezed
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $PupilCopyWith<$Res>? get pupil {
    if (_value.pupil == null) {
      return null;
    }

    return $PupilCopyWith<$Res>(_value.pupil!, (value) {
      return _then(_value.copyWith(pupil: value));
    });
  }

  @override
  $BookCopyWith<$Res>? get book {
    if (_value.book == null) {
      return null;
    }

    return $BookCopyWith<$Res>(_value.book!, (value) {
      return _then(_value.copyWith(book: value));
    });
  }
}

/// @nodoc
abstract class _$LoanCopyWith<$Res> implements $LoanCopyWith<$Res> {
  factory _$LoanCopyWith(_Loan value, $Res Function(_Loan) then) =
      __$LoanCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      Pupil? pupil,
      Book? book,
      bool? isNewLoan,
      bool isLost,
      @TimestampConverter() DateTime loanDate,
      @TimestampConverter() DateTime expectedReturnDate,
      @NullableTimestampConverter() DateTime? returnDate});

  @override
  $PupilCopyWith<$Res>? get pupil;
  @override
  $BookCopyWith<$Res>? get book;
}

/// @nodoc
class __$LoanCopyWithImpl<$Res> extends _$LoanCopyWithImpl<$Res>
    implements _$LoanCopyWith<$Res> {
  __$LoanCopyWithImpl(_Loan _value, $Res Function(_Loan) _then)
      : super(_value, (v) => _then(v as _Loan));

  @override
  _Loan get _value => super._value as _Loan;

  @override
  $Res call({
    Object? id = freezed,
    Object? pupil = freezed,
    Object? book = freezed,
    Object? isNewLoan = freezed,
    Object? isLost = freezed,
    Object? loanDate = freezed,
    Object? expectedReturnDate = freezed,
    Object? returnDate = freezed,
  }) {
    return _then(_Loan(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      pupil: pupil == freezed
          ? _value.pupil
          : pupil // ignore: cast_nullable_to_non_nullable
              as Pupil?,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book?,
      isNewLoan: isNewLoan == freezed
          ? _value.isNewLoan
          : isNewLoan // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLost: isLost == freezed
          ? _value.isLost
          : isLost // ignore: cast_nullable_to_non_nullable
              as bool,
      loanDate: loanDate == freezed
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedReturnDate: expectedReturnDate == freezed
          ? _value.expectedReturnDate
          : expectedReturnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      returnDate: returnDate == freezed
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Loan implements _Loan {
  _$_Loan(
      {this.id,
      this.pupil,
      this.book,
      this.isNewLoan,
      this.isLost = false,
      @TimestampConverter() required this.loanDate,
      @TimestampConverter() required this.expectedReturnDate,
      @NullableTimestampConverter() this.returnDate});

  factory _$_Loan.fromJson(Map<String, dynamic> json) => _$$_LoanFromJson(json);

  @override
  final String? id;
  @override
  final Pupil? pupil;
  @override
  final Book? book;
  @override
  final bool? isNewLoan;
  @JsonKey(defaultValue: false)
  @override
  final bool isLost;
  @override
  @TimestampConverter()
  final DateTime loanDate;
  @override
  @TimestampConverter()
  final DateTime expectedReturnDate;
  @override
  @NullableTimestampConverter()
  final DateTime? returnDate;

  @override
  String toString() {
    return 'Loan(id: $id, pupil: $pupil, book: $book, isNewLoan: $isNewLoan, isLost: $isLost, loanDate: $loanDate, expectedReturnDate: $expectedReturnDate, returnDate: $returnDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loan &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pupil, pupil) || other.pupil == pupil) &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.isNewLoan, isNewLoan) ||
                other.isNewLoan == isNewLoan) &&
            (identical(other.isLost, isLost) || other.isLost == isLost) &&
            (identical(other.loanDate, loanDate) ||
                other.loanDate == loanDate) &&
            (identical(other.expectedReturnDate, expectedReturnDate) ||
                other.expectedReturnDate == expectedReturnDate) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, pupil, book, isNewLoan,
      isLost, loanDate, expectedReturnDate, returnDate);

  @JsonKey(ignore: true)
  @override
  _$LoanCopyWith<_Loan> get copyWith =>
      __$LoanCopyWithImpl<_Loan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoanToJson(this);
  }
}

abstract class _Loan implements Loan {
  factory _Loan(
      {String? id,
      Pupil? pupil,
      Book? book,
      bool? isNewLoan,
      bool isLost,
      @TimestampConverter() required DateTime loanDate,
      @TimestampConverter() required DateTime expectedReturnDate,
      @NullableTimestampConverter() DateTime? returnDate}) = _$_Loan;

  factory _Loan.fromJson(Map<String, dynamic> json) = _$_Loan.fromJson;

  @override
  String? get id;
  @override
  Pupil? get pupil;
  @override
  Book? get book;
  @override
  bool? get isNewLoan;
  @override
  bool get isLost;
  @override
  @TimestampConverter()
  DateTime get loanDate;
  @override
  @TimestampConverter()
  DateTime get expectedReturnDate;
  @override
  @NullableTimestampConverter()
  DateTime? get returnDate;
  @override
  @JsonKey(ignore: true)
  _$LoanCopyWith<_Loan> get copyWith => throw _privateConstructorUsedError;
}
