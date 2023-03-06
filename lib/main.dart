import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:film_gamed_app/core/resources/routes_manger.dart';
import 'package:film_gamed_app/core/services/services_locator.dart';
import 'package:film_gamed_app/features/app/presentation/manager/application_bloc.dart';
import 'package:film_gamed_app/features/app/presentation/manager/application_event.dart';
import 'package:film_gamed_app/features/app/presentation/manager/cubit/app_cubit.dart';
import 'package:film_gamed_app/features/app/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/theme_manger.dart';
import 'core/utils/app_string.dart';
import 'features/tv/presentation/pages/tv_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: ThemeProvider(
        initTheme: getApplicationTheme(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          theme: getApplicationTheme(),
          darkTheme: getApplicationDarkTheme(),
          //themeMode: ThemeMode.system,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.homeRoute,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // routes: {
//       //   ExtractArgumentsScreen.routeName: (context) =>
//       //       const ExtractArgumentsScreen(),
//       // },
//       // // Provide a function to handle named routes.
//       // Use this function to identify the named
//       // route being pushed, and create the correct
//       // Screen.
//       onGenerateRoute: (settings) {
//         // If you push the PassArguments route
//         if (settings.name == PassArgumentsScreen.routeName) {
//           // Cast the arguments to the correct
//           // type: ScreenArguments.
//           final args = settings.arguments as ScreenArguments;

//           // Then, extract the required data from
//           // the arguments and pass the data to the
//           // correct screen.
//           return MaterialPageRoute(
//             builder: (context) {
//               return PassArgumentsScreen(
//                 title: args.title,
//                 message: args.message,
//               );
//             },
//           );
//         }
//         // The code only supports
//         // PassArgumentsScreen.routeName right now.
//         // Other values need to be implemented if we
//         // add them. The assertion here will help remind
//         // us of that higher up in the call stack, since
//         // this assertion would otherwise fire somewhere
//         // in the framework.
//         return null;
//       },
//       title: 'Navigation with Arguments',
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // A button that navigates to a named route.
//             // The named route extracts the arguments
//             // by itself.
//             // ElevatedButton(
//             //   onPressed: () {
//             //     // When the user taps the button,
//             //     // navigate to a named route and
//             //     // provide the arguments as an optional
//             //     // parameter.
//             //     Navigator.pushNamed(
//             //       context,
//             //       ExtractArgumentsScreen.routeName,
//             //       arguments: ScreenArguments(
//             //         'Extract Arguments Screen',
//             //         'This message is extracted in the build method.',
//             //       ),
//             //     );
//             //   },
//             //   child: const Text('Navigate to screen that extracts arguments'),
//             // ),
//             // A button that navigates to a named route.
//             // For this route, extract the arguments in
//             // the onGenerateRoute function and pass them
//             // to the screen.
//             ElevatedButton(
//               onPressed: () {
//                 // When the user taps the button, navigate
//                 // to a named route and provide the arguments
//                 // as an optional parameter.
//                 Navigator.pushNamed(
//                   context,
//                   PassArgumentsScreen.routeName,
//                   arguments: ScreenArguments(
//                     'Accept Arguments Screen',
//                     'This message is extracted in the onGenerateRoute '
//                         'function.',
//                   ),
//                 );
//               },
//               child: const Text('Navigate to a named that accepts arguments'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // A Widget that extracts the necessary arguments from
// // the ModalRoute.
// // class ExtractArgumentsScreen extends StatelessWidget {
// //   const ExtractArgumentsScreen({super.key});

// //   static const routeName = '/extractArguments';

// //   @override
// //   Widget build(BuildContext context) {
// //     // Extract the arguments from the current ModalRoute
// //     // settings and cast them as ScreenArguments.
// //     final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(args.title),
// //       ),
// //       body: Center(
// //         child: Text(args.message),
// //       ),
// //     );
// //   }
// // }

// // A Widget that accepts the necessary arguments via the
// // constructor.
// class PassArgumentsScreen extends StatelessWidget {
//   static const routeName = '/passArguments';

//   final String title;
//   final String message;

//   // This Widget accepts the arguments as constructor
//   // parameters. It does not extract the arguments from
//   // the ModalRoute.
//   //
//   // The arguments are extracted by the onGenerateRoute
//   // function provided to the MaterialApp widget.
//   const PassArgumentsScreen({
//     super.key,
//     required this.title,
//     required this.message,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(message),
//       ),
//     );
//   }
// }

// // You can pass any object to the arguments parameter.
// // In this example, create a class that contains both
// // a customizable title and message.
// class ScreenArguments {
//   final String title;
//   final String message;

//   ScreenArguments(this.title, this.message);
// }
