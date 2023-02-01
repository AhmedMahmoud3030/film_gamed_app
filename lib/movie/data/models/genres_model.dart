import 'package:film_gamed_app/movie/domain/entities/generes.dart';

class GenresModel extends Genres {
  const GenresModel(
    super.name,
    super.id,
  );

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        json['name'],
        json['is'],
      );
}
