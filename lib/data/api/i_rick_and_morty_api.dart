import 'package:rick_and_morty_app/data/api/models/characters_dto.dart';

import 'models/character_hint_dto.dart';

abstract class IRickAndMortyApi {
  Future<CharactersDto> getCharacters(
    String filterName,
  );

  Future<List<CharacterHintDto>> getCharacterHints(
    String filterName,
  );
}
