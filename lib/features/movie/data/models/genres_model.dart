import '../../domain/entities/generes.dart';

class GenresMovieModel extends Genres {
  const GenresMovieModel({required super.name, required super.id});

  factory GenresMovieModel.fromJson(Map<String, dynamic> json) =>
      GenresMovieModel(
        name: json['name'],
        id: json['id'],
      );
}
