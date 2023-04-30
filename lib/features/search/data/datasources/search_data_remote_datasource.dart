import 'package:dio/dio.dart';
import 'package:film_gamed_app/core/error/exceptions.dart';
import 'package:film_gamed_app/core/network/api_constance.dart';
import 'package:film_gamed_app/core/network/error_message_model.dart';
import 'package:film_gamed_app/features/search/data/models/search_data_model.dart';
import 'package:film_gamed_app/features/search/domain/usecases/get_search_data.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchDataModel>> getSearchDataRemoteDataSource(
      SearchParameters parameters);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<List<SearchDataModel>> getSearchDataRemoteDataSource(
      SearchParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.search(parameters.searchQuery));

    if (response.statusCode == 200) {
      return List<SearchDataModel>.from((response.data['results'] as List)
          .map((e) => SearchDataModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
