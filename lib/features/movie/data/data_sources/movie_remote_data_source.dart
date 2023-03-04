import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_message_model.dart';
import '../../domain/entities/recommendation_movie.dart';
import '../../domain/use_cases/get_movie_details_usecase.dart';
import '../../domain/use_cases/get_recommendation_usecase.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<RecommendationMovie>> getRecommendationMovies(
      RecommendationMovieParameters recommendationParameters);
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
  Future<List<RecommendationMovie>> getRecommendationMovies(
      RecommendationMovieParameters recommendationParameters) async {
    final response = await Dio().get(
        ApiConstance.recommendationMovie(recommendationParameters.id) +
            ApiConstance.apiKey);
    if (response.statusCode == 200) {
      return List<RecommendationMovieModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationMovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
