import 'package:equatable/equatable.dart';

import 'generes.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<GenresMovie> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
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
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}
