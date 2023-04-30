// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetSearchDateEvent extends SearchEvent {
  final String searchQuery;

  const GetSearchDateEvent(this.searchQuery);

  @override
  List<Object> get props => [searchQuery];
}
