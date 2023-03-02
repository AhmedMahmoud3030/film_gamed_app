import 'package:equatable/equatable.dart';

class GenresMovie extends Equatable {
  final String name;
  final int id;

  const GenresMovie({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];
}
