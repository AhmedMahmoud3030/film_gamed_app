import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:film_gamed_app/features/search/domain/entities/search_data.dart';
import 'package:film_gamed_app/features/search/domain/usecases/get_search_data.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchData>>> getSearchDataRepository(
      SearchParameters parameters);
}
