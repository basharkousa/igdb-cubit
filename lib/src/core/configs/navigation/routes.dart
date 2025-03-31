import 'package:flutter/material.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamesscreen/cubit/games_cubit.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamesscreen/games_screen.dart';
import 'package:igameapp/src/features/game/presentation/screens/savedgamesscreen/cubit/saved_games_cubit.dart';
import 'package:igameapp/src/features/splash/presentation/splash_screen.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamedetailsscreen/game_details_screen.dart';
import 'package:igameapp/src/features/game/presentation/screens/savedgamesscreen/saved_games_screen.dart';
import '../../../../src/core/di/getit/injection.dart';
import '../../../features/setting/presentation/cubit/settings_cubit.dart';
import '../../../features/setting/presentation/settings_screen.dart';
import '../../../../src/core/utils/page_transition.dart';

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
      case GamesScreen.route:
        return PageTransition(
            child: GamesScreen(gamesCubit: getIt<GamesCubit>(),),
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
          return SavedGamesScreen(cubit: getIt<SavedGamesCubit>());
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


