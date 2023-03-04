import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/error/exceptions.dart';
import 'package:film_gamed_app/core/error/failure.dart';

import '../../domain/entities/recommendation_tv.dart';
import '../../domain/entities/tv.dart';
import '../../domain/entities/tv_details.dart';
import '../../domain/repositories/base_tv_repository.dart';
import '../../domain/use_cases/get_recommendation_tv_usecase.dart';
import '../../domain/use_cases/get_tv_details_usecase.dart';
import '../data_sources/tv_remote_data_source.dart';

class TVRepositories extends BaseTVRepository {
  final BaseTVRemoteDataSource baseTVRemoteDataSource;

  TVRepositories(this.baseTVRemoteDataSource);

  @override
  Future<Either<Failure, List<TV>>> getOnTheAirTVs() async {
    final result = await baseTVRemoteDataSource.getOnTheAirTVs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getPopularTVs() async {
    final result = await baseTVRemoteDataSource.getPopularTVs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTopRatedTVs() async {
    final result = await baseTVRemoteDataSource.getTopRatedTVs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TVDetail>> getTVDetails(
      TVDetailParameters parameters) async {
    final result = await baseTVRemoteDataSource.getTVDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationTV>>> getRecommendationTVs(
      RecommendationTVParameters parameters) async {
    final result =
        await baseTVRemoteDataSource.getRecommendationTVs(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
