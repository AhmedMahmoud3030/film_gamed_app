// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:film_gamed_app/features/search/domain/usecases/get_search_data.dart';
import 'package:film_gamed_app/features/search/presentation/bloc/search_state.dart';

part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchDataUseCase getSearchDataUseCase;
  SearchBloc(this.getSearchDataUseCase) : super(const SearchState()) {
    on<GetSearchDateEvent>(_getSearchData);
  }

  FutureOr<void> _getSearchData(
      GetSearchDateEvent event, Emitter<SearchState> emit) async {
    final result = await getSearchDataUseCase(
      SearchParameters(
        searchQuery: event.searchQuery,
      ),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          searchMessage: l.message,
          searchState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          searchState: RequestState.loaded,
          searchData: r,
        ),
      ),
    );
  }
}
