// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:film_gamed_app/core/usecase/base_usecase.dart';
import 'package:film_gamed_app/features/search/domain/entities/search_data.dart';
import 'package:film_gamed_app/features/search/domain/repositories/search_repository.dart';

class GetSearchDataUseCase
    extends BaseUseCase<List<SearchData>, SearchParameters> {
  final SearchRepository searchRepository;

  GetSearchDataUseCase(this.searchRepository);

  @override
  Future<Either<Failure, List<SearchData>>> call(
      SearchParameters parameters) async {
    return await searchRepository.getSearchDataRepository(parameters);
  }
}

class SearchParameters extends Equatable {
  final String searchQuery;
  const SearchParameters({
    required this.searchQuery,
  });

  @override
  List<Object> get props => [searchQuery];
}
