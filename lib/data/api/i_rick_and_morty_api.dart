import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/data/api/models/characters.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';

import 'models/character_hint.dart';

abstract class IRickAndMortyApi {
  Future<Characters> getCharacters(
    String filterName,
  );

  Future<List<CharacterHint>> getCharacterHints(
    String filterName,
  );
}
