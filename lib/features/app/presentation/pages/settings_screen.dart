import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      '/home/black/Documents/StudioProjects/film_gamed_app/assets/images/logo_color.svg'),
                  Text(
                    'Movie App',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
