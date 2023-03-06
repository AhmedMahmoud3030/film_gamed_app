import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:film_gamed_app/features/app/presentation/pages/settings_screen.dart';
import 'package:film_gamed_app/features/movie/presentation/pages/movies_screen.dart';
import 'package:film_gamed_app/features/tv/presentation/pages/tv_screen.dart';
import 'package:flutter/material.dart';

class AppState {
  final bool isDarkTheme;
  final Widget screen;
  final String logoImage;

  AppState({
    required this.isDarkTheme,
    required this.screen,
    required this.logoImage,
  });

  AppState copyWith({
    bool? isDarkTheme,
    Widget? screen,
    String? logoImage,
  }) {
    return AppState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      screen: screen ?? this.screen,
      logoImage: logoImage ?? this.logoImage,
    );
  }
}
