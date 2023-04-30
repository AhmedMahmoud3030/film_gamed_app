import '../../domain/entities/tv_details.dart';

class TVDetailModel extends TVDetail {
  const TVDetailModel({
    required super.backdropPath,
    required super.firstAirDate,
    //required super.genres,
    required super.id,
    required super.name,
    required super.voteAverage,
    required super.overview,
  });
  factory TVDetailModel.fromJson(Map<String, dynamic> json) => TVDetailModel(
        backdropPath: json['backdrop_path'] ?? json['poster_path'] ?? 'NOPIC',
        firstAirDate: json['first_air_date'],
        // genres: List<GenresTVModel>.from((json['genres'] as List).map(
        //   (e) => GenresTVModel.fromJson(e),
        // )),
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
      );
}
