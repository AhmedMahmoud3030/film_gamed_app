import 'package:equatable/equatable.dart';
import 'package:film_gamed_app/movie/domain/entities/generes.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseData;
  final int runTime;
  final String title;
  final String voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseData,
    required this.runTime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        genres,
        backdropPath,
        id,
        overview,
        releaseData,
        runtimeType,
        title,
        voteAverage,
      ];
}
