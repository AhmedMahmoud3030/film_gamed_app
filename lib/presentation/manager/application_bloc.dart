import 'dart:async';

import 'package:film_gamed_app/core/utils/app_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/movies_screen.dart';
import '../pages/settings_screen.dart';
import '../pages/tv_screen.dart';
import 'application_event.dart';
import 'application_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(AppState(
            isDarkTheme: false,
            screen: const MoviesScreen(),
            logoImage: AppString.logoLight)) {
    on<ChangeAppThemeEvent>(_changeAppTheme);

    on<ChangeAppScreenEvent>(_changeAppScreen);

    // on<GetPopularMoviesEvent>(_getPopularMovies);

    // on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  // void _getAppScreen(GetAppScreenEvent event, Emitter<AppState> emit) async {
  //   if (state.screenIndex == 0) {
  //     emit(state.copyWith(screen: MoviesScreen()));
  //   } else if (state.screenIndex == 1) {
  //     emit(state.copyWith(screen: TVsScreen()));
  //   } else if (state.screenIndex == 2) {
  //     emit(state.copyWith(screen: SettingsScreen()));
  //   }
  // }

  // FutureOr<void> _getPopularMovies(
  //     GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
  //   final result = await getPopularMoviesUseCase(const NoParameters());
  //   result.fold(
  //     (l) => emit(
  //       state.copyWith(
  //         popularMoviesState: RequestState.error,
  //         popularMessage: l.message,
  //       ),
  //     ),
  //     (r) => emit(
  //       state.copyWith(
  //         popularMovies: r,
  //         popularMoviesState: RequestState.loaded,
  //       ),
  //     ),
  //   );
  // }

  // FutureOr<void> _getTopRatedMovies(
  //     GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
  //   final result = await getTopRatedMoviesUseCase(const NoParameters());
  //   result.fold(
  //     (l) => emit(
  //       state.copyWith(
  //         topRatedMoviesState: RequestState.error,
  //         topRatedMessage: l.message,
  //       ),
  //     ),
  //     (r) => emit(
  //       state.copyWith(
  //         topRatedMovies: r,
  //         topRatedMoviesState: RequestState.loaded,
  //       ),
  //     ),
  //   );
  // }

  void _changeAppTheme(ChangeAppThemeEvent event, Emitter<AppState> emit) {
    if (event.isDark == true) {
      emit(state.copyWith(
        isDarkTheme: true,
        logoImage: AppString.logoLight,
      ));
    } else if (event.isDark == false) {
      emit(state.copyWith(
        isDarkTheme: false,
        logoImage: AppString.logoDark,
      ));
    }
  }

  FutureOr<void> _changeAppScreen(
      ChangeAppScreenEvent event, Emitter<AppState> emit) {
    if (event.index == 0) {
      emit(state.copyWith(screen: const MoviesScreen()));
    } else if (event.index == 1) {
      emit(state.copyWith(screen: const TVsScreen()));
    } else if (event.index == 2) {
      emit(state.copyWith(screen: const SettingsScreen()));
    }
  }
}
