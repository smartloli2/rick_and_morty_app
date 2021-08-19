// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _ShowHistory showHistory(List<SearchRequest> searchRequests) {
    return _ShowHistory(
      searchRequests,
    );
  }

  _ShowResults showResults(
      {required List<Character> characters, bool isLoadingMore = false}) {
    return _ShowResults(
      characters: characters,
      isLoadingMore: isLoadingMore,
    );
  }

  _ShowError showError({required String? message}) {
    return _ShowError(
      message: message,
    );
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchRequest> searchRequests) showHistory,
    required TResult Function(List<Character> characters, bool isLoadingMore)
        showResults,
    required TResult Function(String? message) showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchRequest> searchRequests)? showHistory,
    TResult Function(List<Character> characters, bool isLoadingMore)?
        showResults,
    TResult Function(String? message)? showError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ShowHistory value) showHistory,
    required TResult Function(_ShowResults value) showResults,
    required TResult Function(_ShowError value) showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ShowHistory value)? showHistory,
    TResult Function(_ShowResults value)? showResults,
    TResult Function(_ShowError value)? showError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchRequest> searchRequests) showHistory,
    required TResult Function(List<Character> characters, bool isLoadingMore)
        showResults,
    required TResult Function(String? message) showError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchRequest> searchRequests)? showHistory,
    TResult Function(List<Character> characters, bool isLoadingMore)?
        showResults,
    TResult Function(String? message)? showError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ShowHistory value) showHistory,
    required TResult Function(_ShowResults value) showResults,
    required TResult Function(_ShowError value) showError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ShowHistory value)? showHistory,
    TResult Function(_ShowResults value)? showResults,
    TResult Function(_ShowError value)? showError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchRequest> searchRequests) showHistory,
    required TResult Function(List<Character> characters, bool isLoadingMore)
        showResults,
    required TResult Function(String? message) showError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchRequest> searchRequests)? showHistory,
    TResult Function(List<Character> characters, bool isLoadingMore)?
        showResults,
    TResult Function(String? message)? showError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ShowHistory value) showHistory,
    required TResult Function(_ShowResults value) showResults,
    required TResult Function(_ShowError value) showError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ShowHistory value)? showHistory,
    TResult Function(_ShowResults value)? showResults,
    TResult Function(_ShowError value)? showError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ShowHistoryCopyWith<$Res> {
  factory _$ShowHistoryCopyWith(
          _ShowHistory value, $Res Function(_ShowHistory) then) =
      __$ShowHistoryCopyWithImpl<$Res>;
  $Res call({List<SearchRequest> searchRequests});
}

/// @nodoc
class __$ShowHistoryCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$ShowHistoryCopyWith<$Res> {
  __$ShowHistoryCopyWithImpl(
      _ShowHistory _value, $Res Function(_ShowHistory) _then)
      : super(_value, (v) => _then(v as _ShowHistory));

  @override
  _ShowHistory get _value => super._value as _ShowHistory;

  @override
  $Res call({
    Object? searchRequests = freezed,
  }) {
    return _then(_ShowHistory(
      searchRequests == freezed
          ? _value.searchRequests
          : searchRequests // ignore: cast_nullable_to_non_nullable
              as List<SearchRequest>,
    ));
  }
}

/// @nodoc
class _$_ShowHistory implements _ShowHistory {
  const _$_ShowHistory(this.searchRequests);

  @override
  final List<SearchRequest> searchRequests;

  @override
  String toString() {
    return 'SearchState.showHistory(searchRequests: $searchRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowHistory &&
            (identical(other.searchRequests, searchRequests) ||
                const DeepCollectionEquality()
                    .equals(other.searchRequests, searchRequests)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchRequests);

  @JsonKey(ignore: true)
  @override
  _$ShowHistoryCopyWith<_ShowHistory> get copyWith =>
      __$ShowHistoryCopyWithImpl<_ShowHistory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchRequest> searchRequests) showHistory,
    required TResult Function(List<Character> characters, bool isLoadingMore)
        showResults,
    required TResult Function(String? message) showError,
  }) {
    return showHistory(searchRequests);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchRequest> searchRequests)? showHistory,
    TResult Function(List<Character> characters, bool isLoadingMore)?
        showResults,
    TResult Function(String? message)? showError,
    required TResult orElse(),
  }) {
    if (showHistory != null) {
      return showHistory(searchRequests);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ShowHistory value) showHistory,
    required TResult Function(_ShowResults value) showResults,
    required TResult Function(_ShowError value) showError,
  }) {
    return showHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ShowHistory value)? showHistory,
    TResult Function(_ShowResults value)? showResults,
    TResult Function(_ShowError value)? showError,
    required TResult orElse(),
  }) {
    if (showHistory != null) {
      return showHistory(this);
    }
    return orElse();
  }
}

abstract class _ShowHistory implements SearchState {
  const factory _ShowHistory(List<SearchRequest> searchRequests) =
      _$_ShowHistory;

  List<SearchRequest> get searchRequests => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ShowHistoryCopyWith<_ShowHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ShowResultsCopyWith<$Res> {
  factory _$ShowResultsCopyWith(
          _ShowResults value, $Res Function(_ShowResults) then) =
      __$ShowResultsCopyWithImpl<$Res>;
  $Res call({List<Character> characters, bool isLoadingMore});
}

/// @nodoc
class __$ShowResultsCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$ShowResultsCopyWith<$Res> {
  __$ShowResultsCopyWithImpl(
      _ShowResults _value, $Res Function(_ShowResults) _then)
      : super(_value, (v) => _then(v as _ShowResults));

  @override
  _ShowResults get _value => super._value as _ShowResults;

  @override
  $Res call({
    Object? characters = freezed,
    Object? isLoadingMore = freezed,
  }) {
    return _then(_ShowResults(
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      isLoadingMore: isLoadingMore == freezed
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_ShowResults implements _ShowResults {
  const _$_ShowResults({required this.characters, this.isLoadingMore = false});

  @override
  final List<Character> characters;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoadingMore;

  @override
  String toString() {
    return 'SearchState.showResults(characters: $characters, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowResults &&
            (identical(other.characters, characters) ||
                const DeepCollectionEquality()
                    .equals(other.characters, characters)) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingMore, isLoadingMore)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(characters) ^
      const DeepCollectionEquality().hash(isLoadingMore);

  @JsonKey(ignore: true)
  @override
  _$ShowResultsCopyWith<_ShowResults> get copyWith =>
      __$ShowResultsCopyWithImpl<_ShowResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchRequest> searchRequests) showHistory,
    required TResult Function(List<Character> characters, bool isLoadingMore)
        showResults,
    required TResult Function(String? message) showError,
  }) {
    return showResults(characters, isLoadingMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchRequest> searchRequests)? showHistory,
    TResult Function(List<Character> characters, bool isLoadingMore)?
        showResults,
    TResult Function(String? message)? showError,
    required TResult orElse(),
  }) {
    if (showResults != null) {
      return showResults(characters, isLoadingMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ShowHistory value) showHistory,
    required TResult Function(_ShowResults value) showResults,
    required TResult Function(_ShowError value) showError,
  }) {
    return showResults(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ShowHistory value)? showHistory,
    TResult Function(_ShowResults value)? showResults,
    TResult Function(_ShowError value)? showError,
    required TResult orElse(),
  }) {
    if (showResults != null) {
      return showResults(this);
    }
    return orElse();
  }
}

abstract class _ShowResults implements SearchState {
  const factory _ShowResults(
      {required List<Character> characters,
      bool isLoadingMore}) = _$_ShowResults;

  List<Character> get characters => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ShowResultsCopyWith<_ShowResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ShowErrorCopyWith<$Res> {
  factory _$ShowErrorCopyWith(
          _ShowError value, $Res Function(_ShowError) then) =
      __$ShowErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$ShowErrorCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$ShowErrorCopyWith<$Res> {
  __$ShowErrorCopyWithImpl(_ShowError _value, $Res Function(_ShowError) _then)
      : super(_value, (v) => _then(v as _ShowError));

  @override
  _ShowError get _value => super._value as _ShowError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ShowError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
class _$_ShowError implements _ShowError {
  const _$_ShowError({required this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'SearchState.showError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ShowErrorCopyWith<_ShowError> get copyWith =>
      __$ShowErrorCopyWithImpl<_ShowError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchRequest> searchRequests) showHistory,
    required TResult Function(List<Character> characters, bool isLoadingMore)
        showResults,
    required TResult Function(String? message) showError,
  }) {
    return showError(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchRequest> searchRequests)? showHistory,
    TResult Function(List<Character> characters, bool isLoadingMore)?
        showResults,
    TResult Function(String? message)? showError,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ShowHistory value) showHistory,
    required TResult Function(_ShowResults value) showResults,
    required TResult Function(_ShowError value) showError,
  }) {
    return showError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ShowHistory value)? showHistory,
    TResult Function(_ShowResults value)? showResults,
    TResult Function(_ShowError value)? showError,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class _ShowError implements SearchState {
  const factory _ShowError({required String? message}) = _$_ShowError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ShowErrorCopyWith<_ShowError> get copyWith =>
      throw _privateConstructorUsedError;
}
