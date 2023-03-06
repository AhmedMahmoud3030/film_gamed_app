part of 'app_cubit.dart';

class AppState extends Equatable {
  int screenIndex;
  Widget screens;

  AppState({required this.screenIndex, required this.screens});

  @override
  List<Object?> get props => [screenIndex, screens];
}
