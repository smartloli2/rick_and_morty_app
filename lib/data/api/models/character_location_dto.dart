import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/character_location.dart';

part 'character_location_dto.g.dart';

@JsonSerializable()
class CharacterLocationDto {
  final String name;
  final String url;

  CharacterLocationDto({
    required this.name,
    required this.url,
  });

  factory CharacterLocationDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationDtoFromJson(json);

  factory CharacterLocationDto.fromDomain(
    CharacterLocation characterLocation,
  ) =>
      CharacterLocationDto(
        name: characterLocation.name,
        url: characterLocation.url,
      );

  Map<String, dynamic> toJson() => _$CharacterLocationDtoToJson(this);

  CharacterLocation toDomain() => CharacterLocation(name: name, url: url);
}
