import '../../domain/entities/recommendation_tv.dart';

class RecommendationTVModel extends RecommendationTV {
  const RecommendationTVModel(
    super.backdropPath, {
    required super.id,
  });

  factory RecommendationTVModel.fromJson(Map<String, dynamic> json) =>
      RecommendationTVModel(
        json['backdrop_path'] ?? json['poster_path'],
        id: json['id'],
      );
}
