import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/core/exceptions/exception.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/data/api/models/character.dart';
import 'package:rick_and_morty_app/data/api/models/characters.dart';
import 'package:rick_and_morty_app/data/repositories/rick_and_morty_repository.dart';
import 'package:rick_and_morty_app/features/search/logic/search_state.dart';

part 'search_store.g.dart';

class SearchStore extends _SearchStore with _$SearchStore {
  SearchStore(
    RickAndMortyRepository rickAndMortyRepository,
  ) : super(rickAndMortyRepository);
}

abstract class _SearchStore with Store {
  final RickAndMortyRepository _rickAndMortyRepository;

  _SearchStore(this._rickAndMortyRepository);

  @observable
  ObservableFuture<Either<BussinessException, Characters>>? _charactersFuture;

  @observable
  Characters? characters;

  @observable
  Option<String> errorMessage = none();

  @computed
  List<Character>? get characterList => characters?.results;

  @computed
  SearchState get state {
    if (_charactersFuture == null ||
        _charactersFuture?.status == FutureStatus.rejected) {
      return const SearchState.initial();
    }

    return _charactersFuture?.status == FutureStatus.pending
        ? const SearchState.loading()
        : SearchState.loaded(characters: characters!.results);
  }

  @action
  Future<void> getCharacters(String filterName) async {
    errorMessage = none();

    _charactersFuture =
        ObservableFuture(_rickAndMortyRepository.getCharacters(filterName));

    final failOrCharacters = await _charactersFuture;

    failOrCharacters?.fold((e) {
      errorMessage = some("Couldn't fetch characters. Is the device online?");
    }, (characters) {
      this.characters = characters;
      log.info(characters.results.toString());
    });
  }
}
