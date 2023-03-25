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
