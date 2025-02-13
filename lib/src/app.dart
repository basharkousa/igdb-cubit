import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/configs/navigation/route_observer.dart';
import 'package:igameapp/src/di/getit/injection.dart';
import 'configs/app_theme.dart';
import 'configs/navigation/routes.dart';
import 'data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'ui/screens/getStartedScreens/splashScreen/splash_screen.dart';

class App extends StatelessWidget {
   const App({super.key});

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
        return MaterialApp(
          // fallbackLocale: const Locale('en', 'US'),
          locale: Get.deviceLocale,
          // locale: Locale('en'),
          // locale: Locale(
          //     Get.find<SharedPreferenceHelper>().currentLanguage ?? 'en'),
          // translationsKeys: AppTranslation.translations,
          debugShowMaterialGrid: false,
          title: "My Games App",
          // theme: AppTheme.darkTheme(Get.find<SharedPreferenceHelper>().currentLanguage??'ar'),
          // theme: AppTheme.getAppThem(Get.find<SharedPreferenceHelper>().themeMode??'dark'),
          theme: AppTheme.getAppThem(getIt<SharedPreferenceHelper>().themeMode??'dark'),
          initialRoute: SplashScreenPage.route,
          navigatorObservers: [MyRouteObserver()],
          routes: Routes.routes,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
