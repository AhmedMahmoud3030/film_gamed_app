import 'package:film_gamed_app/core/services/services_locator.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_string.dart';
import 'features/tv/presentation/pages/tv_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      home: TVsScreen(),
    );
  }
}
