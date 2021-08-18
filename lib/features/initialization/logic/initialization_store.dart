import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/core/di.dart' as di;
import 'package:rick_and_morty_app/data/db/models/character_location_model.dart';
import 'package:rick_and_morty_app/data/db/models/character_model.dart';
import 'package:rick_and_morty_app/data/db/models/search_request_model.dart';
import 'package:rick_and_morty_app/features/initialization/logic/initialization_state.dart';

part 'initialization_store.g.dart';

class InitializationStore = _InitializationStoreBase with _$InitializationStore;

abstract class _InitializationStoreBase with Store {
  @observable
  InitializationState state = const InitializationState.initial();

  @action
  Future<void> initializeApp() async {
    state = const InitializationState.inProgress();

    await di.init();

    await Hive.initFlutter();

    Hive
      ..registerAdapter(SearchRequestModelAdapter())
      ..registerAdapter(CharacterModelAdapter())
      ..registerAdapter(CharacterLocationModelAdapter());

    state = const InitializationState.initialized();
  }
}
