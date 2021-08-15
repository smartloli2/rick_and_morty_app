import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/data/db/hive_constants.dart';
import 'package:rick_and_morty_app/data/db/models/character_location_model.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';

part 'character_model.g.dart';

@HiveType(typeId: HiveTypeIds.character)
class CharacterModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String species;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final CharacterLocationModel origin;
  @HiveField(7)
  final CharacterLocationModel location;
  @HiveField(8)
  final String image;
  @HiveField(9)
  final List<String> episode;
  @HiveField(10)
  final String url;
  @HiveField(11)
  final DateTime created;

  const CharacterModel({
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

  @override
  List<Object?> get props => [id];

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

  factory CharacterModel.fromDomain(
    Character character,
  ) =>
      CharacterModel(
        id: character.id,
        name: character.name,
        status: character.status,
        species: character.species,
        type: character.type,
        gender: character.gender,
        origin: CharacterLocationModel.fromDomain(character.origin),
        location: CharacterLocationModel.fromDomain(character.location),
        image: character.image,
        episode: character.episode,
        url: character.url,
        created: character.created,
      );
}
