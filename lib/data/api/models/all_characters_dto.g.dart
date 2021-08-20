// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_characters_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCharactersDto _$AllCharactersDtoFromJson(Map<String, dynamic> json) {
  return AllCharactersDto(
    info: InfoDto.fromJson(json['info'] as Map<String, dynamic>),
    results: (json['results'] as List<dynamic>)
        .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllCharactersDtoToJson(AllCharactersDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
