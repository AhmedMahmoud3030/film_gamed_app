part of 'tv_detail_bloc.dart';

class TVDetailState extends Equatable {
  const TVDetailState({
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
    this.tvDetail,
    this.tvDetailState = RequestState.loading,
    this.tvDetailMessage = '',
  });

  final TVDetail? tvDetail;
  final RequestState tvDetailState;
  final String tvDetailMessage;

  final List<RecommendationTV> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  TVDetailState copyWith({
    TVDetail? tvDetail,
    RequestState? tvDetailState,
    String? tvDetailMessage,
    List<RecommendationTV>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return TVDetailState(
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
      tvDetail: tvDetail ?? this.tvDetail,
      tvDetailMessage: tvDetailMessage ?? this.tvDetailMessage,
      tvDetailState: tvDetailState ?? this.tvDetailState,
    );
  }

  @override
  List<Object?> get props => [
        recommendation,
        recommendationMessage,
        recommendationState,
        tvDetail,
        tvDetailState,
        tvDetailMessage,
      ];
}
