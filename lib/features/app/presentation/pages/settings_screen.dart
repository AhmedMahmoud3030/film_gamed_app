import 'package:film_gamed_app/core/utils/app_string.dart';
import 'package:film_gamed_app/features/app/presentation/manager/application_bloc.dart';
import 'package:film_gamed_app/features/app/presentation/manager/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_switch/sliding_switch.dart';

import '../manager/application_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_white.png',
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    Text(
                      AppString.appSetting,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          AppString.theme,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SlidingSwitch(
                          value: false,
                          width: 150,
                          height: 40,
                          onChanged: (bool value) {
                            print(value);
                          },
                          animationDuration: const Duration(milliseconds: 400),
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                          iconOff: FeatherIcons.sun,
                          iconOn: FeatherIcons.moon,
                          contentSize: 17,
                          colorOn: const Color(0xffdc6c73),
                          colorOff: const Color(0xff6682c0),
                          background: const Color(0xffe4e5eb),
                          buttonColor: const Color(0xfff7f5f7),
                          inactiveColor: const Color(0xff636f7b),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          AppString.language,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SlidingSwitch(
                          value: false,
                          width: 150,
                          height: 40,
                          onChanged: (bool value) {
                            print(value);
                          },
                          animationDuration: const Duration(milliseconds: 400),
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                          textOff: "English",
                          textOn: "Arabic",
                          contentSize: 17,
                          background: const Color(0xffe4e5eb),
                          buttonColor: Theme.of(context).hoverColor,
                          inactiveColor: Theme.of(context).shadowColor,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       'Save',
                    //       style: Theme.of(context).textTheme.titleSmall,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
