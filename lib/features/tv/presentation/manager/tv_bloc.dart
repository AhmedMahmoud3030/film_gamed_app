import 'dart:async';

import 'package:film_gamed_app/core/usecase/base_usecase.dart';
import 'package:film_gamed_app/core/utils/enums.dart';
import 'package:film_gamed_app/features/tv/presentation/manager/tv_event.dart';
import 'package:film_gamed_app/features/tv/presentation/manager/tv_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_on_the_air_tv_usecase.dart';
import '../../domain/use_cases/get_popular_tv_usecase.dart';
import '../../domain/use_cases/get_top_rated_tv_usecase.dart';

class TVsBloc extends Bloc<TVsEvent, TVsState> {
  final GetOnTheAirTvUseCase getOnTheAirUseCase;
  final GetPopularTVsUseCase getPopularTVsUseCase;
  final GetTopRatedTVsUseCase getTopRatedTVsUseCase;
  TVsBloc(
    this.getOnTheAirUseCase,
    this.getPopularTVsUseCase,
    this.getTopRatedTVsUseCase,
  ) : super(const TVsState()) {
    on<GetOnTheAirTVsEvent>(_getOnTheAirTVs);

    on<GetPopularTVsEvent>(_getPopularTVs);

    on<GetTopRatedTVsEvent>(_getTopRatedTVs);
  }

  FutureOr<void> _getOnTheAirTVs(
      GetOnTheAirTVsEvent event, Emitter<TVsState> emit) async {
    final result = await getOnTheAirUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          onTheAirTVsState: RequestState.error,
          onTheAirMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          onTheAirTVs: r,
          onTheAirTVsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularTVs(
      GetPopularTVsEvent event, Emitter<TVsState> emit) async {
    final result = await getPopularTVsUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularTVsState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularTVs: r,
          popularTVsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedTVs(
      GetTopRatedTVsEvent event, Emitter<TVsState> emit) async {
    final result = await getTopRatedTVsUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedTVsState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedTVs: r,
          topRatedTVsState: RequestState.loaded,
        ),
      ),
    );
  }
}
