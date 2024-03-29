import '../../domain/entities/generes.dart';

class GenresTVModel extends Genres {
  const GenresTVModel({required super.name, required super.id});

  factory GenresTVModel.fromJson(Map<String, dynamic> json) => GenresTVModel(
        name: json['id'],
        id: json['name'],
      );
}
