import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_app_flutter/app/configure_getIt.dart';
import 'package:movie_app_flutter/screens/drawer_animation/drawer_animation_bloc/drawer_animation_bloc.dart';
import 'screens/home_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  configureDependencies();
  runApp(MaterialApp(
    home: BlocProvider<DrawerAnimationBloc>(
      create: (context) => DrawerAnimationBloc(),
      child: Film(),
    ),
  ));
}
