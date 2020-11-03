// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../Data/repository/apiClient.dart';
import '../Data/repository/api_repository.dart';
import '../screens/favourite_screen/favourite_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);

  // Eager singletons must be registered in the right order
  gh.singleton<ApiClient>(ApiClient());
  gh.singleton<ApiRepository>(ApiRepository());
  gh.singleton<FavouriteBloc>(FavouriteBloc());
  return get;
}
