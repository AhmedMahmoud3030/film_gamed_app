part of 'tv_detail_bloc.dart';

abstract class TVDetailEvent extends Equatable {
  const TVDetailEvent();
}

class GetTVDetailsEvent extends TVDetailEvent {
  final int id;

  const GetTVDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetTVRecommendationEvent extends TVDetailEvent {
  final int id;

  const GetTVRecommendationEvent(this.id);

  @override
  List<Object?> get props => [id];
}
