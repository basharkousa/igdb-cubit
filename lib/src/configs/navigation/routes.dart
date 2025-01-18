import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/game_details_screen.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/home_screen.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/savedgamesscreen/saved_games_screen.dart';
import 'package:igameapp/src/ui/screens/settingscreen/settings_screen.dart';
import '../../ui/screens/getStartedScreens/splashScreen/splash_screen.dart';

class Routes {
  Routes._();

  static final List<GetPage> getPages = [
    GetPage(
      name: SplashScreenPage.route,
      page: () =>  SplashScreenPage(),
    ),
    GetPage(
      name: HomeScreen.route,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: GameDetailsScreen.route,
      page: () => GameDetailsScreen(),
    ),
    GetPage(
      name: SavedGamesScreen.route,
      page: () => SavedGamesScreen(),
    ),
    GetPage(
      name: SettingsScreen.route,
      page: () => SettingsScreen(),
    ),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings,)  {
    switch (settings.name) {
      case SplashScreenPage.route:
        return MaterialPageRoute(builder: (_) {
          return SplashScreenPage(
          );
        });
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
