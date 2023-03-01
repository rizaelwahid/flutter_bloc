import 'package:rizaelwahid/bloc/counter_bloc/counter_bloc.dart';
import 'package:rizaelwahid/screens/other/notfound_screen.dart';
import 'package:rizaelwahid/screens/navs/main_screen.dart';
import 'package:rizaelwahid/screens/other/other_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRouter {
  final CounterBloc myCounter = CounterBloc();
  // final ThemeBloc myTheme = ThemeBloc();
  // final UserBloc myUser = UserBloc();
  Route onRizaWays(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: myCounter),
              // BlocProvider.value(value: myTheme),
            ],
            child: const MainPage(),
          ),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: myCounter),
              // BlocProvider.value(value: myTheme),
            ],
            child: const OtherPage(),
          ),
        );
      // case "/blocSlector":
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider.value(
      //       value: myUser,
      //       child: const SelectorPage(),
      //     ),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotfoundPage(),
        );
    }
  }
}
