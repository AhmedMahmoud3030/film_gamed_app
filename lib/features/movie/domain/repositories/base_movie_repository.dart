import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation_movie.dart';
import '../use_cases/get_movie_details_usecase.dart';
import '../use_cases/get_recommendation_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<RecommendationMovie>>> getRecommendationMovies(
      RecommendationMovieParameters parameters);
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameters parameters);
}
