part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState({
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.movieDetailMessage = '',
  });

  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailMessage;

  final List<RecommendationMovie> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<RecommendationMovie>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailState(
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      movieDetailState: movieDetailState ?? this.movieDetailState,
    );
  }

  @override
  List<Object?> get props => [
        recommendation,
        recommendationMessage,
        recommendationState,
        movieDetail,
        movieDetailState,
        movieDetailMessage,
      ];
}
