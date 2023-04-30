import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/application_bloc.dart';
import '../manager/application_state.dart';
import '../widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const MyDrawer(),
          body: state.screen,
        );
      },
    );
  }
}
