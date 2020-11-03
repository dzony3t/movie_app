import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'screens/home_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  configureDependencies();
  runApp(MaterialApp(
    home: Film(
    ),
  ));
}
