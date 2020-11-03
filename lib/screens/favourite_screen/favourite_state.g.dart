// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavouriteState _$_$_FavouriteStateFromJson(Map<String, dynamic> json) {
  return _$_FavouriteState(
    movies: (json['movies'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_FavouriteStateToJson(_$_FavouriteState instance) =>
    <String, dynamic>{
      'movies': instance.movies,
    };
