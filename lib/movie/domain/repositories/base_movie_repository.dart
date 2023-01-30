import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepository{

  Future<Either<Failure, List<Movie>>>  getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>>  getPopularMovies();
  Future<Either<Failure, List<Movie>>>  getTopRatedMovies();
}