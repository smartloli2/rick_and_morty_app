import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';

part 'search_state.freezed.dart';

// Todo: сделать частью стора (part of)
@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded({
    required List<Character> characters,
  }) = _Loaded;
  // const factory SearchState.error([String? message]) = ErrorDetails;

}
