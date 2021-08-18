import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/search_request.dart';

part 'search_state.freezed.dart';

// Todo: сделать частью стора (part of)
@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = _Loading;

  const factory SearchState.showHistory(
    List<SearchRequest> searchRequests,
  ) = _ShowHistory;

  const factory SearchState.showResults({
    required List<Character> characters,
  }) = _ShowResults;

  const factory SearchState.showError({
    required String? message,
  }) = _ShowError;
}
