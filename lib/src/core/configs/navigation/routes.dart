import 'package:flutter/material.dart';
import '../../../../src/core/di/getit/injection.dart';
import '../../../../src/core/presentation/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart';
import '../../../../src/core/presentation/screens/gamesscreens/gamedetailsscreen/game_details_screen.dart';
import '../../../../src/core/presentation/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import '../../../../src/core/presentation/screens/gamesscreens/homescreen/home_screen.dart';
import '../../../../src/core/presentation/screens/gamesscreens/savedgamesscreen/saved_games_screen.dart';
import '../../../../src/core/presentation/screens/settingscreen/cubit/settings_cubit.dart';
import '../../../../src/core/presentation/screens/settingscreen/settings_screen.dart';
import '../../../../src/core/utils/page_transition.dart';
import '../../presentation/screens/getStartedScreens/splashScreen/splash_screen.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    // SplashScreenPage.route: (BuildContext context) => SplashScreenPage(),
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
            child: HomeScreen(homeCubit: getIt<HomeCubit>(),),
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
          child: SettingsScreen(getIt<SettingsCubit>()),
          type: PageTransitionType.fade,
        );
      case SavedGamesScreen.route:
        return MaterialPageRoute(
            settings: settings,
            barrierDismissible: true,
            builder: (_){
          return SavedGamesScreen(homeCubit: getIt<HomeCubit>());
        });

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


