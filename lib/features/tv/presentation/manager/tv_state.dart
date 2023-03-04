import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/core/utils/enums.dart';

import '../../domain/entities/tv.dart';

class TVsState extends Equatable {
  final List<TV> onTheAirTVs;
  final RequestState onTheAirTVsState;
  final String onTheAirMessage;

  final List<TV> popularTVs;
  final RequestState popularTVsState;
  final String popularMessage;

  final List<TV> topRatedTVs;
  final RequestState topRatedTVsState;
  final String topRatedMessage;

  const TVsState({
    this.onTheAirTVs = const [],
    this.onTheAirTVsState = RequestState.loading,
    this.onTheAirMessage = '',
    this.popularTVs = const [],
    this.popularTVsState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTVs = const [],
    this.topRatedTVsState = RequestState.loading,
    this.topRatedMessage = '',
  });

  TVsState copyWith({
    List<TV>? onTheAirTVs,
    RequestState? onTheAirTVsState,
    String? onTheAirMessage,
    List<TV>? popularTVs,
    RequestState? popularTVsState,
    String? popularMessage,
    List<TV>? topRatedTVs,
    RequestState? topRatedTVsState,
    String? topRatedMessage,
  }) {
    return TVsState(
      onTheAirTVs: onTheAirTVs ?? this.onTheAirTVs,
      onTheAirTVsState: onTheAirTVsState ?? this.onTheAirTVsState,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      popularTVs: popularTVs ?? this.popularTVs,
      popularMessage: popularMessage ?? this.popularMessage,
      popularTVsState: popularTVsState ?? this.popularTVsState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedTVs: topRatedTVs ?? this.topRatedTVs,
      topRatedTVsState: topRatedTVsState ?? this.topRatedTVsState,
    );
  }

  @override
  List<Object> get props => [
        onTheAirTVs,
        onTheAirTVsState,
        onTheAirMessage,
        popularMessage,
        popularTVs,
        popularTVsState,
        topRatedMessage,
        topRatedTVs,
        topRatedTVsState,
      ];
}
