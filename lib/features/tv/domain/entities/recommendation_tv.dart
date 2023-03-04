import 'package:equatable/equatable.dart';

class RecommendationTV extends Equatable {
  final String? backdropPath;
  final int id;

  const RecommendationTV(this.backdropPath, {required this.id});

  @override
  List<Object?> get props => [backdropPath, id];
}
