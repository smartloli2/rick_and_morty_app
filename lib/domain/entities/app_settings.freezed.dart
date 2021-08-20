// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppSettingsTearOff {
  const _$AppSettingsTearOff();

  _AppSettings call(
      {required AppThemeType currentThemeType,
      required ShowModeType showModeType}) {
    return _AppSettings(
      currentThemeType: currentThemeType,
      showModeType: showModeType,
    );
  }
}

/// @nodoc
const $AppSettings = _$AppSettingsTearOff();

/// @nodoc
mixin _$AppSettings {
  AppThemeType get currentThemeType => throw _privateConstructorUsedError;
  ShowModeType get showModeType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res>;
  $Res call({AppThemeType currentThemeType, ShowModeType showModeType});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  final AppSettings _value;
  // ignore: unused_field
  final $Res Function(AppSettings) _then;

  @override
  $Res call({
    Object? currentThemeType = freezed,
    Object? showModeType = freezed,
  }) {
    return _then(_value.copyWith(
      currentThemeType: currentThemeType == freezed
          ? _value.currentThemeType
          : currentThemeType // ignore: cast_nullable_to_non_nullable
              as AppThemeType,
      showModeType: showModeType == freezed
          ? _value.showModeType
          : showModeType // ignore: cast_nullable_to_non_nullable
              as ShowModeType,
    ));
  }
}

/// @nodoc
abstract class _$AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(
          _AppSettings value, $Res Function(_AppSettings) then) =
      __$AppSettingsCopyWithImpl<$Res>;
  @override
  $Res call({AppThemeType currentThemeType, ShowModeType showModeType});
}

/// @nodoc
class __$AppSettingsCopyWithImpl<$Res> extends _$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(
      _AppSettings _value, $Res Function(_AppSettings) _then)
      : super(_value, (v) => _then(v as _AppSettings));

  @override
  _AppSettings get _value => super._value as _AppSettings;

  @override
  $Res call({
    Object? currentThemeType = freezed,
    Object? showModeType = freezed,
  }) {
    return _then(_AppSettings(
      currentThemeType: currentThemeType == freezed
          ? _value.currentThemeType
          : currentThemeType // ignore: cast_nullable_to_non_nullable
              as AppThemeType,
      showModeType: showModeType == freezed
          ? _value.showModeType
          : showModeType // ignore: cast_nullable_to_non_nullable
              as ShowModeType,
    ));
  }
}

/// @nodoc
class _$_AppSettings extends _AppSettings {
  const _$_AppSettings(
      {required this.currentThemeType, required this.showModeType})
      : super._();

  @override
  final AppThemeType currentThemeType;
  @override
  final ShowModeType showModeType;

  @override
  String toString() {
    return 'AppSettings(currentThemeType: $currentThemeType, showModeType: $showModeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppSettings &&
            (identical(other.currentThemeType, currentThemeType) ||
                const DeepCollectionEquality()
                    .equals(other.currentThemeType, currentThemeType)) &&
            (identical(other.showModeType, showModeType) ||
                const DeepCollectionEquality()
                    .equals(other.showModeType, showModeType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentThemeType) ^
      const DeepCollectionEquality().hash(showModeType);

  @JsonKey(ignore: true)
  @override
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);
}

abstract class _AppSettings extends AppSettings {
  const factory _AppSettings(
      {required AppThemeType currentThemeType,
      required ShowModeType showModeType}) = _$_AppSettings;
  const _AppSettings._() : super._();

  @override
  AppThemeType get currentThemeType => throw _privateConstructorUsedError;
  @override
  ShowModeType get showModeType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
