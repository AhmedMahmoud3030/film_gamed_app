import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';

import '../entities/recommendation_movie.dart';
import '../repositories/base_movie_repository.dart';

class GetRecommendationMovieUseCase extends BaseUseCase<
    List<RecommendationMovie>, RecommendationMovieParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<RecommendationMovie>>> call(
      RecommendationMovieParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationMovieParameters extends Equatable {
  final int id;

  const RecommendationMovieParameters(this.id);

  @override
  List<Object> get props => [id];
}
