import '../../domain/entities/recommendation_tv.dart';

class RecommendationTVModel extends RecommendationTV {
  const RecommendationTVModel(
    super.backdropPath, {
    required super.id,
  });

  factory RecommendationTVModel.fromJson(Map<String, dynamic> json) =>
      RecommendationTVModel(
        json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb',
        id: json['id'],
      );
}
