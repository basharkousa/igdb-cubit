import 'package:get/get.dart';
import 'package:igameapp/src/data/local/datasources/floor/app_database.dart';
import '../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AsyncBindings extends Bindings {
  AsyncBindings();

  @override
  Future dependencies() async {
    await Get.putAsync<AppDatabase>(() async {
      final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      return database;
    }, permanent: true,tag: "AppDatabase");

    await Get.putAsync<SharedPreferences>(() async {
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('name', 'Batman');
      return await SharedPreferences.getInstance();
    }, permanent: true);
    await Get.putAsync<SharedPreferenceHelper>(() async {
      return SharedPreferenceHelper(Get.find<SharedPreferences>());
    }, permanent: true);
  }
}
