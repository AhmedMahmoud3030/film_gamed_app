import 'package:film_gamed_app/core/resources/routes_manger.dart';
import 'package:film_gamed_app/core/services/services_locator.dart';
import 'package:film_gamed_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/theme_manger.dart';
import 'core/utils/app_string.dart';
import 'features/app/presentation/manager/application_bloc.dart';
import 'features/app/presentation/manager/application_state.dart';
import 'features/movie/presentation/manager/movies_bloc.dart';
import 'features/movie/presentation/manager/movies_event.dart';
import 'features/tv/presentation/manager/tv_bloc.dart';
import 'features/tv/presentation/manager/tv_event.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(),
        ),
        BlocProvider(
          create: (context) => sl<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<TVsBloc>()
            ..add(GetOnTheAirTVsEvent())
            ..add(GetPopularTVsEvent())
            ..add(GetTopRatedTVsEvent()),
        ),
        BlocProvider(
            create: (context) => sl<MoviesBloc>()
              ..add(GetNowPlayingMoviesEvent())
              ..add(GetPopularMoviesEvent())
              ..add(GetTopRatedMoviesEvent())),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppString.appName,
            theme: state.isDarkTheme
                ? getApplicationDarkTheme()
                : getApplicationTheme(),
            themeMode: ThemeMode.system,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.homeRoute,
          );
        },
      ),
    );
  }
}
