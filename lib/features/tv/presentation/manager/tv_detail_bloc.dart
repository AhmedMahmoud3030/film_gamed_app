import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/recommendation_tv.dart';
import '../../domain/entities/tv_details.dart';
import '../../domain/use_cases/get_recommendation_tv_usecase.dart';
import '../../domain/use_cases/get_tv_details_usecase.dart';

part 'tv_detail_event.dart';

part 'tv_detail_state.dart';

class TVDetailBloc extends Bloc<TVDetailEvent, TVDetailState> {
  TVDetailBloc(this.getTVDetailsUseCase, this.getRecommendationUseCase)
      : super(const TVDetailState()) {
    on<GetTVDetailsEvent>(_getTVDetails);
    on<GetTVRecommendationEvent>(_getTVRecommendation);
  }

  final GetTVDetailsUseCase getTVDetailsUseCase;
  final GetRecommendationTVUseCase getRecommendationUseCase;

  FutureOr<void> _getTVDetails(
      GetTVDetailsEvent event, Emitter<TVDetailState> emit) async {
    final result = await getTVDetailsUseCase(TVDetailParameters(
      tvId: event.id,
    ));

    result.fold(
      (l) => emit(state.copyWith(
        tvDetailState: RequestState.error,
        tvDetailMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        tvDetailState: RequestState.loaded,
        tvDetail: r,
      )),
    );
  }

  FutureOr<void> _getTVRecommendation(
      GetTVRecommendationEvent event, Emitter<TVDetailState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationTVParameters(event.id));

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
