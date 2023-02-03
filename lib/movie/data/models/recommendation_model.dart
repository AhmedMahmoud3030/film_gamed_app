import 'package:film_gamed_app/movie/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel(
    super.backdropPath, {
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb',
        id: json['id'],
      );
}
