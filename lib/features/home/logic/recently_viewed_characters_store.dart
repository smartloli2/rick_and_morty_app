import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/data/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/home/logic/recently_viewed_characters_state.dart';

part 'recently_viewed_characters_store.g.dart';

class RecentlyViewedCharactersStore extends _RecentlyViewedCharactersStore
    with _$RecentlyViewedCharactersStore {
  RecentlyViewedCharactersStore({
    required CharacterRepository characterRepository,
  }) : super(
          characterRepository,
        );
}

abstract class _RecentlyViewedCharactersStore with Store {
  final CharacterRepository _characterRepository;

  _RecentlyViewedCharactersStore(
    this._characterRepository,
  );

  @observable
  RecentlyViewedCharactersState state =
      const RecentlyViewedCharactersState.initial();

  @action
  Future<void> loadWidget() async {
    state = const RecentlyViewedCharactersState.loading();

    final failOrCharacters =
        await _characterRepository.getAllCachedCharacters();

    failOrCharacters.fold(
      (l) => null,
      (characters) {
        state = RecentlyViewedCharactersState.loaded(
          characters: characters
            ..sort((a, b) => a.created.compareTo(b.created)),
        );
      },
    );
  }
}
