import 'package:equatable/equatable.dart';

abstract class TVsEvent extends Equatable {
  const TVsEvent();

  @override
  List<Object> get props => [];
}

class GetOnTheAirTVsEvent extends TVsEvent {}

class GetPopularTVsEvent extends TVsEvent {}

class GetTopRatedTVsEvent extends TVsEvent {}
