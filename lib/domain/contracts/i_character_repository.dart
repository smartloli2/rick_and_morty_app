import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/all_characters.dart';

abstract class ICharacterRepository {
  Future<Either<RickAndMortyException, AllCharacters>> getCharacters(
    String filterName,
  );

  Future<Either<RickAndMortyException, AllCharacters>> getMoreCharacters(
    String url,
  );

  Future<Either<RickAndMortyException, AllCharacters>> getCharacterHints(
    String filterName,
  );

  Future<void> cacheSingleCharacter(Character character);

  Future<Either<RickAndMortyException, List<Character>>>
      getAllCachedCharacters();
}
