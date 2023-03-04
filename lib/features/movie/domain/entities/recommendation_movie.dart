import 'package:equatable/equatable.dart';

class RecommendationMovie extends Equatable {
  final String? backdropPath;
  final int id;

  const RecommendationMovie(this.backdropPath, {required this.id});

  @override
  List<Object?> get props => [backdropPath, id];
}
