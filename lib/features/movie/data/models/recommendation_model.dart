import '../../domain/entities/recommendation_movie.dart';

class RecommendationMovieModel extends RecommendationMovie {
  const RecommendationMovieModel(
    super.backdropPath, {
    required super.id,
  });

  factory RecommendationMovieModel.fromJson(Map<String, dynamic> json) =>
      RecommendationMovieModel(
        json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb',
        id: json['id'],
      );
}
