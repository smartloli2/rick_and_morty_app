import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/all_characters.dart';

import 'character_dto.dart';
import 'info_dto.dart';

part 'all_characters_dto.g.dart';

@JsonSerializable()
class AllCharactersDto extends Equatable {
  final InfoDto info;
  final List<CharacterDto> results;

  const AllCharactersDto({
    required this.info,
    required this.results,
  });

  factory AllCharactersDto.fromJson(Map<String, dynamic> json) =>
      _$AllCharactersDtoFromJson(json);

  factory AllCharactersDto.fromDomain(AllCharacters characters) =>
      AllCharactersDto(
        info: InfoDto.fromDomain(characters.info),
        results: characters.results
            .map((character) => CharacterDto.fromDomain(character))
            .toList(),
      );

  Map<String, dynamic> toJson() => _$AllCharactersDtoToJson(this);

  AllCharacters toDomain() => AllCharacters(
        info: info.toDomain(),
        results: results.map((e) => e.toDomain()).toList(),
      );

  @override
  List<Object> get props => [info, results];
}
