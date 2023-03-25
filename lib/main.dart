import 'package:film_gamed_app/core/resources/routes_manger.dart';
import 'package:film_gamed_app/core/services/services_locator.dart';
import 'package:film_gamed_app/features/app/presentation/manager/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/theme_manger.dart';
import 'core/utils/app_string.dart';
import 'features/app/presentation/manager/application_state.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppString.appName,
            theme: state.isDarkTheme
                ? getApplicationDarkTheme()
                : getApplicationTheme(),
            themeMode: ThemeMode.system,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.homeRoute,
          );
        },
      ),
    );
  }
}
