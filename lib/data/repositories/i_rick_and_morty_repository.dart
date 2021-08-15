import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/data/api/models/characters.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';

abstract class IRickAndMortyRepository {
  Future<Either<RickAndMortyException, Characters>> getCharacters(
    String filterName,
  );

  Future<Either<RickAndMortyException, Characters>> getCharacterHints(
    String filterName,
  );
}
