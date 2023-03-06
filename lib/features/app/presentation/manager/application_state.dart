import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:film_gamed_app/features/app/presentation/pages/settings_screen.dart';
import 'package:film_gamed_app/features/movie/presentation/pages/movies_screen.dart';
import 'package:film_gamed_app/features/tv/presentation/pages/tv_screen.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  const AppState({
    this.screenIndex = 0,
    this.screen = const MoviesScreen(),
  });

  final int screenIndex;
  final Widget screen;

  AppState copyWith({
    int? screenIndex,
    Widget? screen,
  }) {
    return AppState(
      screenIndex: screenIndex ?? this.screenIndex,
      screen: screen ?? this.screen,
    );
  }

  @override
  List<Object?> get props => [
        screenIndex,
        screen,
      ];
}
