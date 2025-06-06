import 'package:flutter/material.dart';
import 'package:igameapp/src/features/auth/presentation/screens/login/cubit/login_cubit.dart';
import 'package:igameapp/src/features/auth/presentation/screens/login/login_screen.dart';
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

  static bool isUserLoggedIn() {
    // Example: Check if the user is logged in using a Cubit/Service
    // You might need to adjust this based on your auth state management
    final loginCubit = getIt<LoginCubit>();
    return loginCubit.state.isLoggedIn; // Assuming your LoginCubit has this state
  }

  static final protectedRoutes = [
    SavedGamesScreen.route,
  ];

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {

    // AuthGuard: Check if the route is protected and the user is not logged in
    if (protectedRoutes.contains(settings.name) && !isUserLoggedIn()) {
      return MaterialPageRoute(
        builder: (_) => LoginScreen(cubit: getIt<LoginCubit>()),
      );
    }

    switch (settings.name) {
      case SplashScreenPage.route:
        return PageTransition(
          child: SplashScreenPage(),
          type: PageTransitionType.fade,
        );
      case GamesScreen.route:
        return PageTransition(
            child: GamesScreen(
              gamesCubit: getIt<GamesCubit>(),
            ),
            type: PageTransitionType.fade,
            duration: Duration(seconds: 1));

      case LoginScreen.route:
        return PageTransition(
            child: LoginScreen(
              cubit: getIt<LoginCubit>(),
            ),
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
            builder: (_) {
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
