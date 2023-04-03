// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:film_gamed_app/features/app/presentation/pages/settings_screen.dart';
// import 'package:film_gamed_app/features/movie/presentation/pages/movies_screen.dart';
// import 'package:film_gamed_app/features/tv/presentation/pages/tv_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'app_state.dart';

// class AppCubit extends Cubit<AppState> {
//   AppCubit() : super(AppInitialState());

//   static AppCubit get(context) => BlocProvider.of(context);

//   int index = 0;
//   List<Widget> screens = [
//     MoviesScreen(),
//     TVsScreen(),
//     SettingsScreen(),
//   ];

//   void setScreenIndex(int value) {
//     index = value;
//     emit(AppScreenState());
//   }
// }
