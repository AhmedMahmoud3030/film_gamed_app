import 'package:film_gamed_app/core/resources/values_manger.dart';
import 'package:film_gamed_app/core/utils/app_string.dart';
import 'package:film_gamed_app/features/app/presentation/manager/application_bloc.dart';
import 'package:film_gamed_app/features/app/presentation/manager/application_event.dart';
import 'package:film_gamed_app/features/app/presentation/manager/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../manager/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      state.logoImage,
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width * 0.96,
                    ),
                    Text(
                      AppString.appSetting,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.theme,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ToggleSwitch(
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                  minHeight: 40.0,
                                  fontSize: AppSize.s16,
                                  initialLabelIndex: 1,
                                  activeBgColor: [
                                    Theme.of(context).shadowColor,
                                    Theme.of(context).primaryColorLight
                                  ],
                                  inactiveBgColor:
                                      Theme.of(context).shadowColor,
                                  icons: [
                                    FeatherIcons.sun,
                                    FeatherIcons.moon,
                                  ],
                                  iconSize: 30,
                                  totalSwitches: 2,
                                  onToggle: (index) {
                                    if (index == 1) {
                                      BlocProvider.of<AppBloc>(context).add(
                                          ChangeAppThemeEvent(isDark: false));
                                    } else if (index == 0) {
                                      BlocProvider.of<AppBloc>(context).add(
                                          ChangeAppThemeEvent(isDark: true));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.language,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ToggleSwitch(
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                  minHeight: 40.0,
                                  fontSize: AppSize.s16,
                                  initialLabelIndex: 1,
                                  activeBgColor: [
                                    Theme.of(context).shadowColor,
                                    Theme.of(context).primaryColorLight
                                  ],
                                  inactiveBgColor:
                                      Theme.of(context).shadowColor,
                                  labels: [
                                    'English',
                                    '??????????????',
                                  ],
                                  iconSize: 30,
                                  totalSwitches: 2,
                                  onToggle: (index) {
                                    if (index == 1) {
                                      BlocProvider.of<AppBloc>(context).add(
                                          ChangeAppThemeEvent(isDark: false));
                                    } else if (index == 0) {
                                      BlocProvider.of<AppBloc>(context).add(
                                          ChangeAppThemeEvent(isDark: true));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
