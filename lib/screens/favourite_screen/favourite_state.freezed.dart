// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favourite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FavouriteState _$FavouriteStateFromJson(Map<String, dynamic> json) {
  return _FavouriteState.fromJson(json);
}

/// @nodoc
class _$FavouriteStateTearOff {
  const _$FavouriteStateTearOff();

// ignore: unused_element
  _FavouriteState call({List<Movie> movies}) {
    return _FavouriteState(
      movies: movies,
    );
  }

// ignore: unused_element
  FavouriteState fromJson(Map<String, Object> json) {
    return FavouriteState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FavouriteState = _$FavouriteStateTearOff();

/// @nodoc
mixin _$FavouriteState {
  List<Movie> get movies;

  Map<String, dynamic> toJson();
  $FavouriteStateCopyWith<FavouriteState> get copyWith;
}

/// @nodoc
abstract class $FavouriteStateCopyWith<$Res> {
  factory $FavouriteStateCopyWith(
          FavouriteState value, $Res Function(FavouriteState) then) =
      _$FavouriteStateCopyWithImpl<$Res>;
  $Res call({List<Movie> movies});
}

/// @nodoc
class _$FavouriteStateCopyWithImpl<$Res>
    implements $FavouriteStateCopyWith<$Res> {
  _$FavouriteStateCopyWithImpl(this._value, this._then);

  final FavouriteState _value;
  // ignore: unused_field
  final $Res Function(FavouriteState) _then;

  @override
  $Res call({
    Object movies = freezed,
  }) {
    return _then(_value.copyWith(
      movies: movies == freezed ? _value.movies : movies as List<Movie>,
    ));
  }
}

/// @nodoc
abstract class _$FavouriteStateCopyWith<$Res>
    implements $FavouriteStateCopyWith<$Res> {
  factory _$FavouriteStateCopyWith(
          _FavouriteState value, $Res Function(_FavouriteState) then) =
      __$FavouriteStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> movies});
}

/// @nodoc
class __$FavouriteStateCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res>
    implements _$FavouriteStateCopyWith<$Res> {
  __$FavouriteStateCopyWithImpl(
      _FavouriteState _value, $Res Function(_FavouriteState) _then)
      : super(_value, (v) => _then(v as _FavouriteState));

  @override
  _FavouriteState get _value => super._value as _FavouriteState;

  @override
  $Res call({
    Object movies = freezed,
  }) {
    return _then(_FavouriteState(
      movies: movies == freezed ? _value.movies : movies as List<Movie>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FavouriteState extends _FavouriteState {
  const _$_FavouriteState({this.movies}) : super._();

  factory _$_FavouriteState.fromJson(Map<String, dynamic> json) =>
      _$_$_FavouriteStateFromJson(json);

  @override
  final List<Movie> movies;

  @override
  String toString() {
    return 'FavouriteState(movies: $movies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FavouriteState &&
            (identical(other.movies, movies) ||
                const DeepCollectionEquality().equals(other.movies, movies)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(movies);

  @override
  _$FavouriteStateCopyWith<_FavouriteState> get copyWith =>
      __$FavouriteStateCopyWithImpl<_FavouriteState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FavouriteStateToJson(this);
  }
}

abstract class _FavouriteState extends FavouriteState {
  const _FavouriteState._() : super._();
  const factory _FavouriteState({List<Movie> movies}) = _$_FavouriteState;

  factory _FavouriteState.fromJson(Map<String, dynamic> json) =
      _$_FavouriteState.fromJson;

  @override
  List<Movie> get movies;
  @override
  _$FavouriteStateCopyWith<_FavouriteState> get copyWith;
}
