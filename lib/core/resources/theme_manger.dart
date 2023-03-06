import 'package:film_gamed_app/core/resources/styles_manger.dart';
import 'package:film_gamed_app/core/resources/values_manger.dart';
import 'package:flutter/material.dart';

import 'color_manger.dart';
import 'font_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    splashColor: ColorManager.secondary,
    scaffoldBackgroundColor: ColorManager.background,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.secondary,
    shadowColor: ColorManager.grey2,
    highlightColor: ColorManager.grey1,
    hintColor: ColorManager.hint,

    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: ColorManager.secondary),

    iconTheme: IconThemeData(
      size: 30,
      color: ColorManager.primary,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.background,
    ),

    textTheme: TextTheme(
      titleMedium: getMediumStyle(
        color: ColorManager.font,
        fontSize: FontSize.s19,
      ),
      titleSmall: getRegularStyle(
        color: ColorManager.font,
        fontSize: FontSize.s16,
      ),
      titleLarge: getSemiBoldStyle(
        color: ColorManager.font,
        fontSize: FontSize.s22,
      ),
      displayLarge: getRegularStyle(
        color: ColorManager.font,
        fontSize: FontSize.s20,
      ),
      displaySmall: getLightStyle(
        color: ColorManager.font,
        fontSize: FontSize.s14,
      ),
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.font,
        fontSize: FontSize.s24,
      ),
      // headlineMedium: getRegularStyle(
      //   color: ColorManager.font,
      //   fontSize: FontSize.s14,
      // ),
      // bodyLarge: getRegularStyle(
      //   color: ColorManager.font,
      // ),
      // bodySmall: getRegularStyle(
      //   color: ColorManager.font,
      // ),
      // bodyMedium: getRegularStyle(
      //   color: ColorManager.font,
      //   fontSize: FontSize.s12,
      // ),
      // labelSmall: getBoldStyle(
      //   color: ColorManager.font,
      //   fontSize: FontSize.s12,
      // ),
    ),

    // // ripple effect color
    // // cardView theme
    // cardTheme: CardTheme(
    //     color: ColorManager.white,
    //     shadowColor: ColorManager.grey1,
    //     elevation: AppSize.s4),
    // // app bar theme
    // appBarTheme: AppBarTheme(
    //     centerTitle: true,
    //     color: ColorManager.primary,
    //     elevation: AppSize.s4,
    //     shadowColor: ColorManager.primary,
    //     titleTextStyle:
    //         getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
    // // button theme
    // buttonTheme: ButtonThemeData(
    //     shape: const StadiumBorder(),
    //     disabledColor: ColorManager.grey1,
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.primary),

    // // elevated button them
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         textStyle: getRegularStyle(
    //             color: ColorManager.white, fontSize: FontSize.s17),
    //         backgroundColor: ColorManager.primary,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s12)))),

    // // input decoration theme (text form field)
    // inputDecorationTheme: InputDecorationTheme(
    //     // content padding
    //     contentPadding: const EdgeInsets.all(AppPadding.p8),
    //     // hint style
    //     hintStyle:
    //         getRegularStyle(color: ColorManager.grey1, fontSize: FontSize.s14),
    //     labelStyle:
    //         getMediumStyle(color: ColorManager.grey1, fontSize: FontSize.s14),
    //     errorStyle: getRegularStyle(color: ColorManager.error),

    //     // enabled border style
    //     enabledBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.grey1, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //     // focused border style
    //     focusedBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //     // error border style
    //     errorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //     // focused border style
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // // label style
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    // main colors
    splashColor: ColorManager.secondaryDark,
    scaffoldBackgroundColor: ColorManager.backgroundDark,
    primaryColor: ColorManager.primaryDark,
    primaryColorLight: ColorManager.secondaryDark,
    shadowColor: ColorManager.grey2Dark,
    highlightColor: ColorManager.grey1Dark,
    hintColor: ColorManager.secondaryDark,

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorManager.secondaryDark,
    ),
    iconTheme: IconThemeData(
      size: 30,
      color: ColorManager.primaryDark,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.backgroundDark,
    ),

    textTheme: TextTheme(
      titleMedium: getMediumStyle(
        color: ColorManager.fontDark,
        fontSize: FontSize.s19,
      ),
      titleSmall: getRegularStyle(
        color: ColorManager.fontDark,
        fontSize: FontSize.s16,
      ),
      titleLarge: getSemiBoldStyle(
        color: ColorManager.fontDark,
        fontSize: FontSize.s22,
      ),
      displayLarge: getRegularStyle(
        color: ColorManager.fontDark,
        fontSize: FontSize.s20,
      ),
      displaySmall: getLightStyle(
        color: ColorManager.fontDark,
        fontSize: FontSize.s14,
      ),
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.fontDark,
        fontSize: FontSize.s24,
      ),
    ),
    // cardTheme: CardTheme(
    //     color: ColorManager.grey2,
    //     shadowColor: ColorManager.grey1,
    //     elevation: AppSize.s4),
    // headlineLarge: getSemiBoldStyle(
    //   color: ColorManager.font,
    //   fontSize: FontSize.s16,
    // ),
    // headlineMedium: getRegularStyle(
    //   color: ColorManager.font,
    //   fontSize: FontSize.s14,
    // ),
    // bodyLarge: getRegularStyle(
    //   color: ColorManager.font,
    // ),
    // bodySmall: getRegularStyle(
    //   color: ColorManager.font,
    // ),
    // bodyMedium: getRegularStyle(
    //   color: ColorManager.font,
    //   fontSize: FontSize.s12,
    // ),
    // labelSmall: getBoldStyle(
    //   color: ColorManager.font,
    //   fontSize: FontSize.s12,
    // ),

    // // ripple effect color
    // // cardView theme
    // // app bar theme
    // appBarTheme: AppBarTheme(
    //     centerTitle: true,
    //     color: ColorManager.primary,
    //     elevation: AppSize.s4,
    //     shadowColor: ColorManager.primary,
    //     titleTextStyle:
    //         getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
    // // button theme
    // buttonTheme: ButtonThemeData(
    //     shape: const StadiumBorder(),
    //     disabledColor: ColorManager.grey1,
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.primary),

    // // elevated button them
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         textStyle: getRegularStyle(
    //             color: ColorManager.white, fontSize: FontSize.s17),
    //         backgroundColor: ColorManager.primary,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s12)))),

    // // input decoration theme (text form field)
    // inputDecorationTheme: InputDecorationTheme(
    //     // content padding
    //     contentPadding: const EdgeInsets.all(AppPadding.p8),
    //     // hint style
    //     hintStyle:
    //         getRegularStyle(color: ColorManager.grey1, fontSize: FontSize.s14),
    //     labelStyle:
    //         getMediumStyle(color: ColorManager.grey1, fontSize: FontSize.s14),
    //     errorStyle: getRegularStyle(color: ColorManager.error),

    //     // enabled border style
    //     enabledBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.grey1, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //     // focused border style
    //     focusedBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //     // error border style
    //     errorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //     // focused border style
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // // label style
  );
}
