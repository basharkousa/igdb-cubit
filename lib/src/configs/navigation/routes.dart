import 'package:flutter/material.dart';
import 'package:igameapp/src/di/getit/injection.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/game_details_screen.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/home_screen.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/savedgamesscreen/saved_games_screen.dart';
import 'package:igameapp/src/ui/screens/settingscreen/settings_screen.dart';
import 'package:igameapp/src/utils/page_transition.dart';
import '../../ui/screens/getStartedScreens/splashScreen/splash_screen.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    // SplashScreenPage.route: (BuildContext context) => SplashScreenPage(),
    // SavedGamesScreen.route: (BuildContext context) => SavedGamesScreen(),
  };

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case SplashScreenPage.route:
        return PageTransition(
          child: SplashScreenPage(),
          type: PageTransitionType.fade,
        );
      case HomeScreen.route:
        return PageTransition(
            child: HomeScreen(),
            type: PageTransitionType.fade,
            duration: Duration(seconds: 1));

      case GameDetailsScreen.route:
        // final game = settings.arguments;
        return MaterialPageRoute(
            barrierDismissible: true,
            settings: settings,
            builder: (_) {
              return GameDetailsScreen(
                detailsCubit: getIt<GameDetailsCubit>(),
              );
            });

      case SettingsScreen.route:
        return PageTransition(
          child: SettingsScreen(),
          type: PageTransitionType.fade,
        );
      case SavedGamesScreen.route:
        return PageTransition(
          child: SavedGamesScreen(homeCubit:getIt<HomeCubit>()),
          type: PageTransitionType.fade,
        );

      default:
        return MaterialPageRoute(
            barrierDismissible: true,
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}


