// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_viewed_characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecentlyViewedCharactersStore on _RecentlyViewedCharactersStore, Store {
  final _$stateAtom = Atom(name: '_RecentlyViewedCharactersStore.state');

  @override
  RecentlyViewedCharactersState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(RecentlyViewedCharactersState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$loadWidgetAsyncAction =
      AsyncAction('_RecentlyViewedCharactersStore.loadWidget');

  @override
  Future<void> loadWidget() {
    return _$loadWidgetAsyncAction.run(() => super.loadWidget());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
