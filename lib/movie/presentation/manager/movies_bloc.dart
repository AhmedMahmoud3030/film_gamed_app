import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:film_gamed_app/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:film_gamed_app/movie/data/repositories/movies_repositories.dart';
import 'package:film_gamed_app/movie/domain/repositories/base_movie_repository.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:film_gamed_app/movie/presentation/manager/movies_event.dart';
import 'package:film_gamed_app/movie/presentation/manager/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  MoviesBloc(this.getNowPlayingUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingUseCase.execute();

      emit(const MoviesState(nowPlayingMoviesState: RequestState.loaded));

      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingMoviesState: RequestState.error,
            message: l.message,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingMovies: r,
            nowPlayingMoviesState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
