import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_hint.g.dart';

@JsonSerializable()
class CharacterHint extends Equatable {
  final String id;
  final String name;

  const CharacterHint({
    required this.id,
    required this.name,
  });

  factory CharacterHint.fromJson(Map<String, dynamic> json) =>
      _$CharacterHintFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterHintToJson(this);

  @override
  List<Object?> get props => [id, name];
}
