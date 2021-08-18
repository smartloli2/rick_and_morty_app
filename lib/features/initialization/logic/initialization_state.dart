import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';

part 'initialization_state.freezed.dart';

@freezed
class InitializationState with _$InitializationState {
  const factory InitializationState.initial() = _Initial;

  const factory InitializationState.inProgress() = _InProgress;

  const factory InitializationState.initialized() = Initialized;
}
