// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call(
      {required String title,
      String? isbn,
      required String isbn13,
      @NullableTimestampConverter() DateTime? datePublished,
      String? publisher,
      int? pages,
      String? imageUrl,
      String? synopsys,
      List<String> authors = const [],
      String? id,
      dynamic isAvailable = true,
      int totalLoans = 0,
      dynamic isFromISBNdb = false,
      bool isArchived = false}) {
    return _Book(
      title: title,
      isbn: isbn,
      isbn13: isbn13,
      datePublished: datePublished,
      publisher: publisher,
      pages: pages,
      imageUrl: imageUrl,
      synopsys: synopsys,
      authors: authors,
      id: id,
      isAvailable: isAvailable,
      totalLoans: totalLoans,
      isFromISBNdb: isFromISBNdb,
      isArchived: isArchived,
    );
  }

  Book fromJson(Map<String, Object?> json) {
    return Book.fromJson(json);
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
  String get title => throw _privateConstructorUsedError;
  String? get isbn => throw _privateConstructorUsedError;
  String get isbn13 => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get datePublished => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get synopsys => throw _privateConstructorUsedError;
  List<String> get authors => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  dynamic get isAvailable => throw _privateConstructorUsedError;
  int get totalLoans => throw _privateConstructorUsedError;
  dynamic get isFromISBNdb => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String? isbn,
      String isbn13,
      @NullableTimestampConverter() DateTime? datePublished,
      String? publisher,
      int? pages,
      String? imageUrl,
      String? synopsys,
      List<String> authors,
      String? id,
      dynamic isAvailable,
      int totalLoans,
      dynamic isFromISBNdb,
      bool isArchived});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? isbn = freezed,
    Object? isbn13 = freezed,
    Object? datePublished = freezed,
    Object? publisher = freezed,
    Object? pages = freezed,
    Object? imageUrl = freezed,
    Object? synopsys = freezed,
    Object? authors = freezed,
    Object? id = freezed,
    Object? isAvailable = freezed,
    Object? totalLoans = freezed,
    Object? isFromISBNdb = freezed,
    Object? isArchived = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      datePublished: datePublished == freezed
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: synopsys == freezed
          ? _value.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalLoans: totalLoans == freezed
          ? _value.totalLoans
          : totalLoans // ignore: cast_nullable_to_non_nullable
              as int,
      isFromISBNdb: isFromISBNdb == freezed
          ? _value.isFromISBNdb
          : isFromISBNdb // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isArchived: isArchived == freezed
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) then) =
      __$BookCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String? isbn,
      String isbn13,
      @NullableTimestampConverter() DateTime? datePublished,
      String? publisher,
      int? pages,
      String? imageUrl,
      String? synopsys,
      List<String> authors,
      String? id,
      dynamic isAvailable,
      int totalLoans,
      dynamic isFromISBNdb,
      bool isArchived});
}

/// @nodoc
class __$BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(_Book _value, $Res Function(_Book) _then)
      : super(_value, (v) => _then(v as _Book));

  @override
  _Book get _value => super._value as _Book;

  @override
  $Res call({
    Object? title = freezed,
    Object? isbn = freezed,
    Object? isbn13 = freezed,
    Object? datePublished = freezed,
    Object? publisher = freezed,
    Object? pages = freezed,
    Object? imageUrl = freezed,
    Object? synopsys = freezed,
    Object? authors = freezed,
    Object? id = freezed,
    Object? isAvailable = freezed,
    Object? totalLoans = freezed,
    Object? isFromISBNdb = freezed,
    Object? isArchived = freezed,
  }) {
    return _then(_Book(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String,
      datePublished: datePublished == freezed
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      synopsys: synopsys == freezed
          ? _value.synopsys
          : synopsys // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: isAvailable == freezed ? _value.isAvailable : isAvailable,
      totalLoans: totalLoans == freezed
          ? _value.totalLoans
          : totalLoans // ignore: cast_nullable_to_non_nullable
              as int,
      isFromISBNdb:
          isFromISBNdb == freezed ? _value.isFromISBNdb : isFromISBNdb,
      isArchived: isArchived == freezed
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Book implements _Book {
  _$_Book(
      {required this.title,
      this.isbn,
      required this.isbn13,
      @NullableTimestampConverter() this.datePublished,
      this.publisher,
      this.pages,
      this.imageUrl,
      this.synopsys,
      this.authors = const [],
      this.id,
      this.isAvailable = true,
      this.totalLoans = 0,
      this.isFromISBNdb = false,
      this.isArchived = false});

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  final String title;
  @override
  final String? isbn;
  @override
  final String isbn13;
  @override
  @NullableTimestampConverter()
  final DateTime? datePublished;
  @override
  final String? publisher;
  @override
  final int? pages;
  @override
  final String? imageUrl;
  @override
  final String? synopsys;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> authors;
  @override
  final String? id;
  @JsonKey(defaultValue: true)
  @override
  final dynamic isAvailable;
  @JsonKey(defaultValue: 0)
  @override
  final int totalLoans;
  @JsonKey(defaultValue: false)
  @override
  final dynamic isFromISBNdb;
  @JsonKey(defaultValue: false)
  @override
  final bool isArchived;

  @override
  String toString() {
    return 'Book(title: $title, isbn: $isbn, isbn13: $isbn13, datePublished: $datePublished, publisher: $publisher, pages: $pages, imageUrl: $imageUrl, synopsys: $synopsys, authors: $authors, id: $id, isAvailable: $isAvailable, totalLoans: $totalLoans, isFromISBNdb: $isFromISBNdb, isArchived: $isArchived)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Book &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.isbn13, isbn13) || other.isbn13 == isbn13) &&
            (identical(other.datePublished, datePublished) ||
                other.datePublished == datePublished) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.synopsys, synopsys) ||
                other.synopsys == synopsys) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            (identical(other.totalLoans, totalLoans) ||
                other.totalLoans == totalLoans) &&
            const DeepCollectionEquality()
                .equals(other.isFromISBNdb, isFromISBNdb) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      isbn,
      isbn13,
      datePublished,
      publisher,
      pages,
      imageUrl,
      synopsys,
      const DeepCollectionEquality().hash(authors),
      id,
      const DeepCollectionEquality().hash(isAvailable),
      totalLoans,
      const DeepCollectionEquality().hash(isFromISBNdb),
      isArchived);

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(this);
  }
}

abstract class _Book implements Book {
  factory _Book(
      {required String title,
      String? isbn,
      required String isbn13,
      @NullableTimestampConverter() DateTime? datePublished,
      String? publisher,
      int? pages,
      String? imageUrl,
      String? synopsys,
      List<String> authors,
      String? id,
      dynamic isAvailable,
      int totalLoans,
      dynamic isFromISBNdb,
      bool isArchived}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  String get title;
  @override
  String? get isbn;
  @override
  String get isbn13;
  @override
  @NullableTimestampConverter()
  DateTime? get datePublished;
  @override
  String? get publisher;
  @override
  int? get pages;
  @override
  String? get imageUrl;
  @override
  String? get synopsys;
  @override
  List<String> get authors;
  @override
  String? get id;
  @override
  dynamic get isAvailable;
  @override
  int get totalLoans;
  @override
  dynamic get isFromISBNdb;
  @override
  bool get isArchived;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}
