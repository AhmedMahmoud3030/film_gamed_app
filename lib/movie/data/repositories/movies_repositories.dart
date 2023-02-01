import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/error/exceptions.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:film_gamed_app/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:film_gamed_app/movie/domain/entities/movie.dart';
import 'package:film_gamed_app/movie/domain/entities/movie_details.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_movie_details_usecase.dart';

import '../../domain/repositories/base_movie_repository.dart';

class MovieRepositories extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepositories(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
