import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
          backdropPath: json['backdrop_path'],
          id: json['id'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          runtime: json['runtime'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble(),
          genres: List<GenresMovieModel>.from(
              json['genres'].map((x) => GenresMovieModel.fromJson(x))));
}
