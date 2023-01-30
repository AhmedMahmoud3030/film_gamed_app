import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String message;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [nowPlayingMovies, nowPlayingMoviesState, message];
}
