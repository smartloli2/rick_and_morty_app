// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  final _$stateAtom = Atom(name: '_SettingsStoreBase.state');

  @override
  SettingsState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SettingsState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$loadSettingsAsyncAction =
      AsyncAction('_SettingsStoreBase.loadSettings');

  @override
  Future<void> loadSettings() {
    return _$loadSettingsAsyncAction.run(() => super.loadSettings());
  }

  final _$updateSettingsAsyncAction =
      AsyncAction('_SettingsStoreBase.updateSettings');

  @override
  Future<void> updateSettings(AppSettings appSettings) {
    return _$updateSettingsAsyncAction
        .run(() => super.updateSettings(appSettings));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
