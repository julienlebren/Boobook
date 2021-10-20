// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String,
      isbn: json['isbn'] as String?,
      isbn13: json['isbn13'] as String,
      datePublished: const NullableTimestampConverter()
          .fromJson(json['datePublished'] as Timestamp?),
      publisher: json['publisher'] as String?,
      pages: json['pages'] as int?,
      imageUrl: json['imageUrl'] as String?,
      synopsys: json['synopsys'] as String?,
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      id: json['id'] as String?,
      isAvailable: json['isAvailable'] ?? true,
      totalLoans: json['totalLoans'] as int? ?? 0,
      isFromISBNdb: json['isFromISBNdb'] ?? false,
      isArchived: json['isArchived'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isbn', instance.isbn);
  val['isbn13'] = instance.isbn13;
  writeNotNull('datePublished',
      const NullableTimestampConverter().toJson(instance.datePublished));
  writeNotNull('publisher', instance.publisher);
  writeNotNull('pages', instance.pages);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('synopsys', instance.synopsys);
  val['authors'] = instance.authors;
  writeNotNull('id', instance.id);
  writeNotNull('isAvailable', instance.isAvailable);
  val['totalLoans'] = instance.totalLoans;
  writeNotNull('isFromISBNdb', instance.isFromISBNdb);
  val['isArchived'] = instance.isArchived;
  return val;
}
