import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {}

//class GetAppScreenEvent extends AppEvent {}
class ChangeAppThemeEvent extends AppEvent {
  final bool isDark;

  ChangeAppThemeEvent({required this.isDark});
  @override
  List<Object?> get props => [isDark];
}

class ChangeAppScreenEvent extends AppEvent {
  final int index;

  ChangeAppScreenEvent({required this.index});
  @override
  List<Object?> get props => [index];
}

// class GetPopularMoviesEvent extends MoviesEvent {}

// class GetTopRatedMoviesEvent extends MoviesEvent {}
