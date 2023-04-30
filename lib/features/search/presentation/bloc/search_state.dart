// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/search_data.dart';

class SearchState extends Equatable {
  final List<SearchData> searchData;
  final RequestState searchState;
  final String searchMessage;

  const SearchState({
    this.searchData = const [],
    this.searchState = RequestState.loading,
    this.searchMessage = '',
  });

  SearchState copyWith({
    List<SearchData>? searchData,
    RequestState? searchState,
    String? searchMessage,
  }) {
    return SearchState(
      searchData: searchData ?? this.searchData,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [searchData, searchState, searchMessage];
}
