import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/domain/entities/character_location.dart';

import '../hive_constants.dart';

part 'character_location_model.g.dart';

@HiveType(typeId: HiveTypeIds.characterLocation)
class CharacterLocationModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;

  CharacterLocationModel({
    required this.name,
    required this.url,
  });

  CharacterLocation toDomain() => CharacterLocation(name: name, url: url);

  factory CharacterLocationModel.fromDomain(
    CharacterLocation characterLocation,
  ) =>
      CharacterLocationModel(
        name: characterLocation.name,
        url: characterLocation.url,
      );
}
