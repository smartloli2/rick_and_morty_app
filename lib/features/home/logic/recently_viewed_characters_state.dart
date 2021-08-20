import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';

part 'recently_viewed_characters_state.freezed.dart';

@freezed
class RecentlyViewedCharactersState with _$RecentlyViewedCharactersState {
  const factory RecentlyViewedCharactersState.initial() = _Initial;

  const factory RecentlyViewedCharactersState.loading() = _Loading;

  const factory RecentlyViewedCharactersState.loaded({
    required List<Character> characters,
  }) = _Loaded;

  // todo: error case
}
