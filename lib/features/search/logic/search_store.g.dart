// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$searchStateAtom = Atom(name: '_SearchStore.searchState');

  @override
  SearchState get searchState {
    _$searchStateAtom.reportRead();
    return super.searchState;
  }

  @override
  set searchState(SearchState value) {
    _$searchStateAtom.reportWrite(value, super.searchState, () {
      super.searchState = value;
    });
  }

  final _$loadSettingsAsyncAction = AsyncAction('_SearchStore.loadSettings');

  @override
  Future<void> loadSettings() {
    return _$loadSettingsAsyncAction.run(() => super.loadSettings());
  }

  final _$loadCharactersAsyncAction =
      AsyncAction('_SearchStore.loadCharacters');

  @override
  Future<void> loadCharacters(String filterName) {
    return _$loadCharactersAsyncAction
        .run(() => super.loadCharacters(filterName));
  }

  final _$loadMoreCharactersAsyncAction =
      AsyncAction('_SearchStore.loadMoreCharacters');

  @override
  Future<void> loadMoreCharacters() {
    return _$loadMoreCharactersAsyncAction
        .run(() => super.loadMoreCharacters());
  }

  final _$showSearchHistoryAsyncAction =
      AsyncAction('_SearchStore.showSearchHistory');

  @override
  Future<void> showSearchHistory() {
    return _$showSearchHistoryAsyncAction.run(() => super.showSearchHistory());
  }

  final _$saveSearchRequestAsyncAction =
      AsyncAction('_SearchStore.saveSearchRequest');

  @override
  Future<void> saveSearchRequest(String input) {
    return _$saveSearchRequestAsyncAction
        .run(() => super.saveSearchRequest(input));
  }

  final _$deleteSearchRequestAsyncAction =
      AsyncAction('_SearchStore.deleteSearchRequest');

  @override
  Future<void> deleteSearchRequest(SearchRequest searchRequest) {
    return _$deleteSearchRequestAsyncAction
        .run(() => super.deleteSearchRequest(searchRequest));
  }

  final _$cacheCharacterAsyncAction =
      AsyncAction('_SearchStore.cacheCharacter');

  @override
  Future<void> cacheCharacter(Character character) {
    return _$cacheCharacterAsyncAction
        .run(() => super.cacheCharacter(character));
  }

  @override
  String toString() {
    return '''
searchState: ${searchState}
    ''';
  }
}
