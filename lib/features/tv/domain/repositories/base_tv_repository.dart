import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/error/failure.dart';

import '../entities/recommendation_tv.dart';
import '../entities/tv.dart';
import '../entities/tv_details.dart';
import '../use_cases/get_recommendation_tv_usecase.dart';
import '../use_cases/get_tv_details_usecase.dart';

abstract class BaseTVRepository {
  Future<Either<Failure, List<TV>>> getOnTheAirTVs();
  Future<Either<Failure, List<TV>>> getPopularTVs();
  Future<Either<Failure, List<TV>>> getTopRatedTVs();
  Future<Either<Failure, List<RecommendationTV>>> getRecommendationTVs(
      RecommendationTVParameters parameters);
  Future<Either<Failure, TVDetail>> getTVDetails(TVDetailParameters parameters);
}
