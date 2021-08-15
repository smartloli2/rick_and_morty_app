// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersDto _$CharactersDtoFromJson(Map<String, dynamic> json) {
  return CharactersDto(
    info: InfoDto.fromJson(json['info'] as Map<String, dynamic>),
    results: (json['results'] as List<dynamic>)
        .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CharactersDtoToJson(CharactersDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
