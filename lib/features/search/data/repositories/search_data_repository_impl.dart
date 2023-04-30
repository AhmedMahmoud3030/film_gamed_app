// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/error/exceptions.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:film_gamed_app/features/search/data/datasources/search_data_remote_datasource.dart';
import 'package:film_gamed_app/features/search/domain/entities/search_data.dart';
import 'package:film_gamed_app/features/search/domain/repositories/search_repository.dart';
import 'package:film_gamed_app/features/search/domain/usecases/get_search_data.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImpl({
    required this.searchRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<SearchData>>> getSearchDataRepository(
      SearchParameters parameters) async {
    final result =
        await searchRemoteDataSource.getSearchDataRemoteDataSource(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
