import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/features/app/presentation/pages/settings_screen.dart';
import 'package:film_gamed_app/features/movie/presentation/pages/movies_screen.dart';
import 'package:film_gamed_app/features/tv/presentation/pages/tv_screen.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  List<Widget> screens = [
    const MoviesScreen(),
    const TVsScreen(),
    const SettingsScreen(),
  ];

  AppCubit()
      : super(AppState(
          screenIndex: 0,
          screens: const MoviesScreen(),
        ));

  void setScreenIndex(int index) {
    emit(AppState(screenIndex: index, screens: screens[index]));
  }
}
