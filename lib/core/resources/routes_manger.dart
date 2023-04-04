import 'package:flutter/material.dart';

import '../../presentation/pages/home_screen.dart';
import '../../presentation/pages/movie_detail_screen.dart';
import '../../presentation/pages/movies_list.dart';
import '../../presentation/pages/movies_screen.dart';
import '../../presentation/pages/settings_screen.dart';
import '../../presentation/pages/tv_detail_screen.dart';
import '../../presentation/pages/tv_screen.dart';
import '../utils/app_string.dart';

class Routes {
  static const String homeRoute = "/";
  static const String movieRoute = "/movie";
  static const String movieDetailRoute = "/movieDetail";
  static const String tvRoute = "/tv";
  static const String tvDetailRoute = "/tvDetail";
  static const String settingsRoute = "/settings";
  static const String moviesList = "/moviesList";
  static const String tvsList = "/tvsList";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.moviesList:
        final movieArgs = settings.arguments as String;

        return MaterialPageRoute(
            builder: (_) => MovieList(
                  args: movieArgs,
                ));
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
                title: const Text(AppString.noRouteFound),
              ),
              body: const Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
