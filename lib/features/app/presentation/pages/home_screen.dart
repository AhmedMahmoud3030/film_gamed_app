import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:film_gamed_app/core/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../manager/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            height: MediaQuery.of(context).size.height * 0.11,
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
            onTap: (value) =>
                BlocProvider.of<AppCubit>(context).setScreenIndex(value),
            animationDuration: const Duration(
              milliseconds: 500,
            ),
          ),
          body: state.screens,
        );
      },
    );
  }
}
