import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/movie/domain/repositories/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetTopRatedMoviesUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);


  Future<Either<Failure, List<Movie>>> execute() async{
    return await baseMovieRepository.getTopRatedMovies();
  }

}