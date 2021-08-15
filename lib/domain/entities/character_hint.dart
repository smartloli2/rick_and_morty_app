import 'package:equatable/equatable.dart';

class CharacterHint extends Equatable {
  final String id;
  final String name;

  const CharacterHint({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
