import 'dart:async';

import 'package:film_gamed_app/core/usecase/base_usecase.dart';
import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:film_gamed_app/features/app/presentation/pages/settings_screen.dart';
import 'package:film_gamed_app/features/movie/presentation/pages/movies_screen.dart';
import 'package:film_gamed_app/features/tv/presentation/pages/tv_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application_event.dart';
import 'application_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(screenIndex: 0, screen: MoviesScreen())) {
    on<GetAppScreenEvent>(_getAppScreen);

    // on<GetPopularMoviesEvent>(_getPopularMovies);

    // on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  void _getAppScreen(GetAppScreenEvent event, Emitter<AppState> emit) async {
    if (state.screenIndex == 0) {
      emit(state.copyWith(screen: MoviesScreen()));
    } else if (state.screenIndex == 1) {
      emit(state.copyWith(screen: TVsScreen()));
    } else if (state.screenIndex == 2) {
      emit(state.copyWith(screen: SettingsScreen()));
    }
  }

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
}
