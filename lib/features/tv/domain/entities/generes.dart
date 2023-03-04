import 'package:equatable/equatable.dart';

class GenresTV extends Equatable {
  const GenresTV({
    required this.id,
    required this.name,
  });
  final int id;
  final String name;

  @override
  List<Object?> get props => [name, id];
}
