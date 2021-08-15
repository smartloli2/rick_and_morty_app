import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/character_hint.dart';

part 'character_hint_dto.g.dart';

@JsonSerializable()
class CharacterHintDto extends Equatable {
  final String id;
  final String name;

  const CharacterHintDto({
    required this.id,
    required this.name,
  });

  factory CharacterHintDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterHintDtoFromJson(json);

  factory CharacterHintDto.fromDomain(CharacterHint characterHint) =>
      CharacterHintDto(
        id: characterHint.id,
        name: characterHint.name,
      );

  Map<String, dynamic> toJson() => _$CharacterHintDtoToJson(this);

  CharacterHint toDomain() => CharacterHint(id: id, name: name);

  @override
  List<Object?> get props => [id, name];
}
