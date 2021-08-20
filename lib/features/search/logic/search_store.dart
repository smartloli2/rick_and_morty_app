import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/data/db/models/types/show_mode_type.dart';
import 'package:rick_and_morty_app/data/repositories/character_repository.dart';
import 'package:rick_and_morty_app/data/repositories/search_request_repository.dart';
import 'package:rick_and_morty_app/data/repositories/settings_repository.dart';
import 'package:rick_and_morty_app/domain/entities/app_settings.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/info.dart';
import 'package:rick_and_morty_app/domain/entities/search_request.dart';
import 'package:rick_and_morty_app/features/search/logic/search_state.dart';

part 'search_store.g.dart';

class SearchStore extends _SearchStore with _$SearchStore {
  SearchStore({
    required CharacterRepository characterRepository,
    required SearchRequestRepository searchRequestRepository,
    required SettingsRepository settingsRepository,
  }) : super(
          characterRepository,
          searchRequestRepository,
          settingsRepository,
        );
}

abstract class _SearchStore with Store {
  final CharacterRepository _characterRepository;
  final SearchRequestRepository _searchRequestRepository;
  final SettingsRepository _settingsRepository;

  _SearchStore(
    this._characterRepository,
    this._searchRequestRepository,
    this._settingsRepository,
  );

  @observable
  SearchState searchState = const SearchState.initial();

  List<SearchRequest> _searchRequests = [];

  List<Character> _characters = [];

  Info? _info;

  AppSettings? appSettings;

  ShowModeType get getShowModeType =>
      appSettings?.showModeType ?? ShowModeType.list;

  @action
  Future<void> loadSettings() async {
    final failOrSettings = await _settingsRepository.loadSettings();

    failOrSettings.fold(
      (fail) {
        appSettings = AppSettings.byDefault();
      },
      (settings) {
        log.debug('Settings was loaded');
        appSettings = settings;
      },
    );

    if (searchState is ShowResults) {
      searchState = SearchState.showResults(
        characters: _characters,
        showModeType: getShowModeType,
      );
    }
  }

  @action
  Future<void> loadCharacters(String filterName) async {
    searchState = const SearchState.loading();

    final failOrCharacters =
        await _characterRepository.getCharacters(filterName);

    failOrCharacters.fold((e) {
      searchState = const SearchState.showError(
          message: "Couldn't fetch characters. Is the device online?");
    }, (allCharacters) {
      _characters = allCharacters.results;
      _info = allCharacters.info;

      searchState = SearchState.showResults(
        characters: allCharacters.results,
        showModeType: getShowModeType,
      );
    });
  }

  @action
  Future<void> loadMoreCharacters() async {
    final url = _info?.next;

    log.debug('loading more characters');

    if (url != null) {
      searchState = SearchState.showResults(
        characters: _characters,
        showModeType: getShowModeType,
        isLoadingMore: true,
      );

      final additionalCharacters =
          await _characterRepository.getMoreCharacters(url);

      additionalCharacters.fold(
        (l) {
          log.warning("couldn't fetch more characters");
        },
        (newCharacters) {
          _characters.addAll(newCharacters.results);
          _info = newCharacters.info;

          searchState = SearchState.showResults(
            characters: _characters,
            showModeType: getShowModeType,
          );
        },
      );
    }
  }

  @action
  Future<void> showSearchHistory() async {
    searchState = const SearchState.loading();

    final failOrRequests = await _searchRequestRepository.getAllRequests();

    failOrRequests.fold(
      (l) {
        log.error('Failed to get search requests');
        searchState = const SearchState.showHistory([]);
      },
      (searchRequests) {
        _searchRequests = searchRequests;
        searchState = SearchState.showHistory(searchRequests);
      },
    );
  }

  @action
  Future<void> saveSearchRequest(String input) async {
    final searchRequest =
        SearchRequest(value: input, createdAtUtc: DateTime.now().toUtc());
    final result = await _searchRequestRepository.saveRequest(searchRequest);

    result.fold((l) {
      log.warning('Failed to save search request');
    }, (r) {
      log.debug('Save request was saved successfully');
      _searchRequests.add(searchRequest);
    });
  }

  @action
  Future<void> deleteSearchRequest(SearchRequest searchRequest) async {
    final result = await _searchRequestRepository.deleteRequest(searchRequest);

    result.fold((l) {
      log.warning('Failed to delete search request');
    }, (r) {
      log.debug('Save request was deleted successfully');
      _searchRequests.remove(searchRequest);
      searchState = SearchState.showHistory(_searchRequests);
    });
  }

  @action
  Future<void> cacheCharacter(Character character) async {
    await _characterRepository.cacheSingleCharacter(character);
    log.debug('Character ${character.name} was cached locally');
  }
}
