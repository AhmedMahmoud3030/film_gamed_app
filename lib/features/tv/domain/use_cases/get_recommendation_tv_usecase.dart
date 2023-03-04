import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';

import '../entities/recommendation_tv.dart';
import '../repositories/base_tv_repository.dart';

class GetRecommendationTVUseCase
    extends BaseUseCase<List<RecommendationTV>, RecommendationTVParameters> {
  final BaseTVRepository baseTVRepository;

  GetRecommendationTVUseCase(this.baseTVRepository);

  @override
  Future<Either<Failure, List<RecommendationTV>>> call(
      RecommendationTVParameters parameters) async {
    return await baseTVRepository.getRecommendationTVs(parameters);
  }
}

class RecommendationTVParameters extends Equatable {
  final int id;

  const RecommendationTVParameters(this.id);

  @override
  List<Object> get props => [id];
}
