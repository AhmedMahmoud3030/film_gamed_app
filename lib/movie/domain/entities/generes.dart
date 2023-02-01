import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final String name;
  final int id;

  const Genres(this.name, this.id);

  @override
  List<Object?> get props => [name, id];
}
