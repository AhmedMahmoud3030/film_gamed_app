import 'package:film_gamed_app/features/app/presentation/manager/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/application_state.dart';
import '../widgets/MyDrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const MyDrawer(),
          /*bottomNavigationBar: CurvedNavigationBar(
            height: MediaQuery.of(context).size.height * 0.10,
            color: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Theme.of(context).splashColor,
            items: const [
              Icon(
                FeatherIcons.film,
              ),
              Icon(
                FeatherIcons.video,
              ),
              Icon(
                FeatherIcons.settings,
              ),
            ],
            index: 0,
            onTap: (value) => BlocProvider.of<AppBloc>(context)
                .add(ChangeAppScreenEvent(index: value)),
            // BlocProvider.of<AppCubit>(context).setScreenIndex(value),
            animationDuration: const Duration(
              milliseconds: 500,
            ),
          ),*/
          body: state.screen,
        );
      },
    );
  }
}
