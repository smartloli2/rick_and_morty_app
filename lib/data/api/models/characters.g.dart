// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Characters _$CharactersFromJson(Map<String, dynamic> json) {
  return Characters(
    info: Info.fromJson(json['info'] as Map<String, dynamic>),
    results: (json['results'] as List<dynamic>)
        .map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CharactersToJson(Characters instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
