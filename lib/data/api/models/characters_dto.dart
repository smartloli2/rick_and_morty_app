import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/characters.dart';

import 'character_dto.dart';
import 'info_dto.dart';

part 'characters_dto.g.dart';

@JsonSerializable()
class CharactersDto extends Equatable {
  final InfoDto info;
  final List<CharacterDto> results;

  const CharactersDto({
    required this.info,
    required this.results,
  });

  factory CharactersDto.fromJson(Map<String, dynamic> json) =>
      _$CharactersDtoFromJson(json);

  factory CharactersDto.fromDomain(Characters characters) => CharactersDto(
        info: InfoDto.fromDomain(characters.info),
        results: characters.results
            .map((character) => CharacterDto.fromDomain(character))
            .toList(),
      );

  Map<String, dynamic> toJson() => _$CharactersDtoToJson(this);

  Characters toDomain() => Characters(
        info: info.toDomain(),
        results: results.map((e) => e.toDomain()).toList(),
      );

  @override
  List<Object> get props => [info, results];
}
