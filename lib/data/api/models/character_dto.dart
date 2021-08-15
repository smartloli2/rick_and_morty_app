import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';

import 'character_location_dto.dart';

part 'character_dto.g.dart';

@JsonSerializable()
class CharacterDto extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationDto origin;
  final CharacterLocationDto location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  const CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  factory CharacterDto.fromDomain(Character character) => CharacterDto(
        id: character.id,
        name: character.name,
        status: character.status,
        species: character.species,
        type: character.type,
        gender: character.gender,
        origin: CharacterLocationDto.fromDomain(character.origin),
        location: CharacterLocationDto.fromDomain(character.location),
        image: character.image,
        episode: character.episode,
        url: character.url,
        created: character.created,
      );

  Map<String, dynamic> toJson() => _$CharacterDtoToJson(this);

  Character toDomain() => Character(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        origin: origin.toDomain(),
        location: location.toDomain(),
        image: image,
        episode: episode,
        url: url,
        created: created,
      );

  @override
  List<Object?> get props => [id];
}
