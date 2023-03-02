import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/base_movie_repository.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
