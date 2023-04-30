import 'package:equatable/equatable.dart';

class TVDetail extends Equatable {
  const TVDetail({
    required this.backdropPath,
    required this.firstAirDate,
    //required this.genres,
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
  });
  final String backdropPath;
  final String firstAirDate;
  //final List<GenresTV> genres;
  final int id;
  final String name;
  final String overview;
  final double voteAverage;

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        // genres,
        id,
        name,
        overview,
        voteAverage,
      ];
}
