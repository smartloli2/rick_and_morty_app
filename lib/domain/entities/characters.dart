import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/info.dart';

class Characters extends Equatable {
  final Info info;
  final List<Character> results;

  const Characters({
    required this.info,
    required this.results,
  });

  @override
  List<Object> get props => [info, results];
}
