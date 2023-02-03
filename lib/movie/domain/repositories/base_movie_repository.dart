import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/movie/domain/entities/movie_details.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_movie_details_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/recommendation.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      RecommendationParameters parameters);
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameters parameters);
}
