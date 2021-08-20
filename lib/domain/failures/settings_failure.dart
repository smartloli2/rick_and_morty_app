import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_failure.freezed.dart';

@freezed
class SettingsFailure with _$SettingsFailure {
  const factory SettingsFailure.emptyStorage() = _EmptyStorage;

  const factory SettingsFailure.unableToLoad(String message) = _UnableToLoad;

  const factory SettingsFailure.unableToUpdate(String message) =
      _UnableToUpdate;

  const factory SettingsFailure.unknownType() = _UnknownType;
}
