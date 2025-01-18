import 'package:get/get.dart';
import 'package:igameapp/src/data/local/datasources/floor/app_database.dart';
import '../../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import '../../../data/local/local_data_source.dart';

class LocalBindings extends Bindings{

  LocalBindings();

  @override
  void dependencies() {

    Get.put(Get.find<AppDatabase>(tag: "AppDatabase").gameDao, permanent: true);


    Get.put(SharedPreferenceHelper(Get.find()), permanent: true);

    Get.lazyPut<LocalDataSource?>(() {
      return LocalDataSource(Get.find(),Get.find());
    }, fenix: true);
  }
}