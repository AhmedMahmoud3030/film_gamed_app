// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SearchData extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String mediaType;
  final String releaseDate;
  const SearchData({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.mediaType,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      mediaType,
      releaseDate,
    ];
  }
}
