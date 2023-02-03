import 'package:film_gamed_app/movie/domain/entities/generes.dart';

class GenresModel extends Genres {
  GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        name: json['name'],
        id: json['id'],
      );
}
