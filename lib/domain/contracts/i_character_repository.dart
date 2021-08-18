import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/characters.dart';

abstract class ICharacterRepository {
  Future<Either<RickAndMortyException, Characters>> getCharacters(
    String filterName,
  );

  Future<Either<RickAndMortyException, Characters>> getCharacterHints(
    String filterName,
  );

  Future<void> cacheSingleCharacter(Character character);

  Future<Either<RickAndMortyException, List<Character>>>
      getAllCachedCharacters();
}
