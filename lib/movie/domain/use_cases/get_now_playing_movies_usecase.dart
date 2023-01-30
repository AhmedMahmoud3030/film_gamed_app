import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/movie/domain/repositories/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetNowPlayingUseCase{
final BaseMovieRepository baseMovieRepository;

  GetNowPlayingUseCase(this.baseMovieRepository);
/*
*      git config --global user.email "ahmed.elbeah@icloud.com"
*
* */

Future<Either<Failure, List<Movie>>> execute() async{
    return await baseMovieRepository.getNowPlayingMovies();
  }

}