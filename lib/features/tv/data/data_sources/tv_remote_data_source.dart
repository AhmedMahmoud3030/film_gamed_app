import 'package:dio/dio.dart';
import 'package:film_gamed_app/core/error/exceptions.dart';
import 'package:film_gamed_app/core/network/api_constance.dart';
import 'package:film_gamed_app/core/network/error_message_model.dart';

import '../../domain/entities/recommendation_tv.dart';
import '../../domain/use_cases/get_recommendation_tv_usecase.dart';
import '../../domain/use_cases/get_tv_details_usecase.dart';
import '../models/recommendation_model.dart';
import '../models/tv_detail_model.dart';
import '../models/tv_model.dart';

abstract class BaseTVRemoteDataSource {
  Future<List<TVModel>> getOnTheAirTVs();
  Future<List<TVModel>> getPopularTVs();
  Future<List<TVModel>> getTopRatedTVs();
  Future<List<RecommendationTV>> getRecommendationTVs(
      RecommendationTVParameters recommendationParameters);
  Future<TVDetailModel> getTVDetails(TVDetailParameters TVDetailParameters);
}

class TVRemoteDataSource extends BaseTVRemoteDataSource {
  @override
  Future<List<TVModel>> getOnTheAirTVs() async {
    final response =
        await Dio().get(ApiConstance.onTheAirTV + ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<TVModel>.from((response.data["results"] as List).map(
        (e) => TVModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TVModel>> getPopularTVs() async {
    final response =
        await Dio().get(ApiConstance.popularTV + ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<TVModel>.from((response.data["results"] as List).map(
        (e) => TVModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TVModel>> getTopRatedTVs() async {
    final response =
        await Dio().get(ApiConstance.topRatedTV + ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<TVModel>.from((response.data["results"] as List).map(
        (e) => TVModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TVDetailModel> getTVDetails(
      TVDetailParameters tvDetailParameters) async {
    final response = await Dio().get(
        ApiConstance.tvDetail(tvDetailParameters.tvId) + ApiConstance.apiKey);
    print('TV=${response.data}');
    if (response.statusCode == 200) {
      return TVDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationTV>> getRecommendationTVs(
      RecommendationTVParameters recommendationParameters) async {
    final response = await Dio().get(
        ApiConstance.recommendationTV(recommendationParameters.id) +
            ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<RecommendationTVModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationTVModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
