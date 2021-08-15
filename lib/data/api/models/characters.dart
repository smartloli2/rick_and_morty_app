import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'character.dart';
import 'info.dart';

part 'characters.g.dart';

@JsonSerializable()
class Characters extends Equatable {
  final Info info;
  final List<Character> results;

  const Characters({
    required this.info,
    required this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);

  @override
  List<Object> get props => [info, results];
}
