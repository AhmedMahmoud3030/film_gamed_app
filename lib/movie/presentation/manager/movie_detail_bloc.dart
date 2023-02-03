import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_movie_details_usecase.dart';
import 'package:film_gamed_app/movie/domain/use_cases/get_recommendation_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailState> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailParameters(
      movieId: event.id,
    ));

    result.fold(
      (l) => emit(state.copyWith(
        movieDetailState: RequestState.error,
        movieDetailMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetailState: RequestState.loaded,
        movieDetail: r,
      )),
    );
  }

  FutureOr<void> _getMovieRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));

    result.fold(
      (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        recommendationState: RequestState.loaded,
        recommendation: r,
      )),
    );
  }
}
