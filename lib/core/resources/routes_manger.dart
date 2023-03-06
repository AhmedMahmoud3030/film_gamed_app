import 'package:film_gamed_app/features/app/presentation/pages/home_screen.dart';
import 'package:film_gamed_app/features/app/presentation/pages/settings_screen.dart';
import 'package:film_gamed_app/features/movie/domain/entities/movie.dart';
import 'package:film_gamed_app/features/movie/domain/entities/movie_details.dart';
import 'package:film_gamed_app/features/movie/presentation/pages/movie_detail_screen.dart';
import 'package:film_gamed_app/features/movie/presentation/pages/movies_screen.dart';
import 'package:film_gamed_app/features/tv/presentation/pages/tv_detail_screen.dart';
import 'package:film_gamed_app/features/tv/presentation/pages/tv_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_string.dart';

class Routes {
  static const String homeRoute = "/";
  static const String movieRoute = "/movie";
  static const String movieDetailRoute = "/movieDetail";
  static const String tvRoute = "/tv";
  static const String tvDetailRoute = "/tvDetail";
  static const String settingsRoute = "/settings";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.movieRoute:
        return MaterialPageRoute(builder: (_) => const MoviesScreen());
      case Routes.movieDetailRoute:
        final movieIdArgs = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => MovieDetailScreen(id: movieIdArgs));
      case Routes.tvRoute:
        return MaterialPageRoute(builder: (_) => const TVsScreen());
      case Routes.tvDetailRoute:
        final tvIdArgs = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => TVDetailScreen(
                  id: tvIdArgs,
                ));
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppString.noRouteFound),
              ),
              body: Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
