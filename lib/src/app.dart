import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/core/configs/localization/l10n/app_localizations.dart';
import 'package:igameapp/src/core/configs/navigation/route_observer.dart';
import 'package:igameapp/src/core/di/getit/injection.dart';
import 'package:igameapp/src/features/splash/presentation/splash_screen.dart';
import 'core/configs/theme/app_theme.dart';
import 'core/configs/navigation/routes.dart';
import 'app/app_cubit.dart';
import 'app/app_state.dart';

class App extends StatelessWidget{

  final appCubit = getIt<AppCubit>();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // statusBarBrightness:
      //     Platform.isAndroid ? Brightness.light : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocProvider.value(
          value: appCubit,
          child: BlocBuilder<AppCubit, AppState>(builder: (context,state){
            return MaterialApp(
              key: appCubit.state.navigatorKey,
              title: "My Games App",
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowMaterialGrid: false,
              // theme: AppTheme.darkTheme(Get.find<SharedPreferenceHelper>().currentLanguage??'ar'),
              // theme: AppTheme.getAppThem(Get.find<SharedPreferenceHelper>().themeMode??'dark'),
              theme: AppTheme.getAppThem(
                 state.themeMode , state.locale.languageCode),
              initialRoute: SplashScreenPage.route,
              // home: LoginScreen(cubit: getIt<LoginCubit>()),
              navigatorObservers: [MyRouteObserver()],
              routes: Routes.routes,
              onGenerateRoute: Routes.generateRoute,
            );
          }),
        );
      },
    );
  }
}
