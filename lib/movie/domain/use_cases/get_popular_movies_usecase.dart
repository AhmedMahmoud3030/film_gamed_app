import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';
import 'package:film_gamed_app/movie/domain/repositories/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
