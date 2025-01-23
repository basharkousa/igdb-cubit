import 'package:get/get.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/ui/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart';
import 'package:igameapp/src/ui/screens/settingscreen/settings_controller.dart';
import '../../controllers/app_controller.dart';
import '../../data/repository.dart';
import 'modules/local_bindings.dart';
import 'modules/remote_bindings.dart';

class AppBindings extends Bindings {
  // final Repository repository;

  // final GlobalAppBloc globalAppBloc;

  AppBindings();

  @override
  void dependencies() {

    LocalBindings().dependencies();

    RemoteBindings().dependencies();

    Get.lazyPut<Repository>(() {
      return Repository(Get.find(), Get.find());
    }, fenix: true);

    Get.put(AppController(Get.find<Repository>()), permanent: true);

    Get.create<SplashCubit>(() {
      return SplashCubit(Get.find<Repository>());
    });

    //Singleton instance
    Get.lazyPut<HomeCubit>(() {
      return HomeCubit(Get.find(),);
    }, fenix: true);

    //Multi instances
    Get.create<GameDetailsCubit>(() {
      return GameDetailsCubit(Get.find());
    });

    // Get.lazyPut<SettingsController>(() {
    //   return SettingsController();
    // }, fenix: true);

  }
}
