import 'package:film_gamed_app/core/services/services_locator.dart';
import 'package:film_gamed_app/movie/presentation/pages/movies_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie App',
      home: MoviesScreen(),
    );
  }
}
