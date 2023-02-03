import 'package:dio/dio.dart';
import 'package:film_gamed_app/core/error/exceptions.dart';
import 'package:film_gamed_app/core/network/api_constance.dart';
import 'package:film_gamed_app/core/network/error_message_model.dart';
import 'package:film_gamed_app/movie/data/models/movie_detail_model.dart';
import 'package:film_gamed_app/movie/data/models/movie_model.dart';
import 'package:film_gamed_app/movie/domain/entities/recommendation.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_movie_details_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_recommendation_usecase.dart';

import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<Recommendation>> getRecommendationMovies(
      RecommendationParameters recommendationParameters);
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailParameters movieDetailParameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response =
        await Dio().get(ApiConstance.nowPlayingMovie + ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await Dio().get(ApiConstance.popularMovie + ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response =
        await Dio().get(ApiConstance.topRatedMovie + ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailParameters movieDetailParameters) async {
    final response = await Dio().get(
        ApiConstance.movieDetail(movieDetailParameters.movieId) +
            ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getRecommendationMovies(
      RecommendationParameters recommendationParameters) async {
    final response = await Dio().get(
        ApiConstance.recommendation(recommendationParameters.id) +
            ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
