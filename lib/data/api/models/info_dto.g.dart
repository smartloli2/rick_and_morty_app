// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoDto _$InfoDtoFromJson(Map<String, dynamic> json) {
  return InfoDto(
    count: json['count'] as int,
    pages: json['pages'] as int,
    next: json['next'] as String?,
    prev: json['prev'] as String?,
  );
}

Map<String, dynamic> _$InfoDtoToJson(InfoDto instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
