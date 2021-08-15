// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  Computed<List<Character>?>? _$characterListComputed;

  @override
  List<Character>? get characterList => (_$characterListComputed ??=
          Computed<List<Character>?>(() => super.characterList,
              name: '_SearchStore.characterList'))
      .value;
  Computed<SearchState>? _$stateComputed;

  @override
  SearchState get state => (_$stateComputed ??=
          Computed<SearchState>(() => super.state, name: '_SearchStore.state'))
      .value;

  final _$_charactersFutureAtom = Atom(name: '_SearchStore._charactersFuture');

  @override
  ObservableFuture<Either<BussinessException, Characters>>?
      get _charactersFuture {
    _$_charactersFutureAtom.reportRead();
    return super._charactersFuture;
  }

  @override
  set _charactersFuture(
      ObservableFuture<Either<BussinessException, Characters>>? value) {
    _$_charactersFutureAtom.reportWrite(value, super._charactersFuture, () {
      super._charactersFuture = value;
    });
  }

  final _$charactersAtom = Atom(name: '_SearchStore.characters');

  @override
  Characters? get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(Characters? value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_SearchStore.errorMessage');

  @override
  Option<String> get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(Option<String> value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getCharactersAsyncAction = AsyncAction('_SearchStore.getCharacters');

  @override
  Future<void> getCharacters(String filterName) {
    return _$getCharactersAsyncAction
        .run(() => super.getCharacters(filterName));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
errorMessage: ${errorMessage},
characterList: ${characterList},
state: ${state}
    ''';
  }
}
