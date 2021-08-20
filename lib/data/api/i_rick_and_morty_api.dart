import 'package:rick_and_morty_app/data/api/models/all_characters_dto.dart';

import 'models/character_hint_dto.dart';

abstract class IRickAndMortyApi {
  Future<AllCharactersDto> getCharacters(
    String filterName,
  );

  Future<AllCharactersDto> getMoreCharacters(
    String url,
  );

  Future<List<CharacterHintDto>> getCharacterHints(
    String filterName,
  );
}
