import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';
import 'package:film_gamed_app/movie/domain/entities/movie_details.dart';
import 'package:film_gamed_app/movie/domain/repositories/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailParameters extends Equatable {
  final int movieId;

  const MovieDetailParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
