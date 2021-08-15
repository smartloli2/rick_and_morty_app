import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';
import 'package:rick_and_morty_app/domain/entities/characters.dart';

class RickAndMortyRepository {
  final RickAndMortyApi rickAndMortyApi;

  const RickAndMortyRepository(this.rickAndMortyApi);

  // Todo: domain transformations?
  Future<Either<RickAndMortyException, Characters>> getCharacters(
    String filterName,
  ) async {
    try {
      final response = await rickAndMortyApi.getCharacters(filterName);
      return right(response.toDomain());
    } on RickAndMortyException catch (e) {
      log.error(e.toString());
      return left(e);
    }
  }
}
