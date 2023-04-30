import 'package:film_gamed_app/features/search/domain/entities/search_data.dart';

class SearchDataModel extends SearchData {
  const SearchDataModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.mediaType,
    required super.releaseDate,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) =>
      SearchDataModel(
        id: json['id'],
        title: json['title'] ??
            json['original_title'] ??
            json['name'] ??
            json['original_name'] ??
            'no title data',
        backdropPath: json['backdrop_path'] ??
            json['poster_path'] ??
            json['known_for']['backdrop_path'] ??
            json['known_for']['poster_path'] ??
            'NOPIC',
        mediaType: json['media_type'] ?? 'no media type',
        releaseDate: json['release_date'] ?? 'no release lang',
      );
}
