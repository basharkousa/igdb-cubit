import 'package:get/get.dart';
import 'package:igameapp/src/configs/app_theme.dart';
import 'package:igameapp/src/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/data/repository.dart';

// with SingleGetTickerProviderMixin
class SettingsController extends GetxController{

  final Repository repository = Get.find();

  SettingsController();

  List<ThemeModel> themeModelList = ThemeModel.themesList;

  @override
  void onInit() {
    for (var theme in themeModelList) {
      if(theme.key == Get.find<SharedPreferenceHelper>().themeMode){
        theme.isSelected.value = true;
      }
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async{

  }

  void onColorItemClick(ThemeModel themeModel) {
    for (var theme in themeModelList) {
      theme.isSelected.value = false;
    }
    themeModel.isSelected.value = true;
    AppTheme.changeAppTheme(themeModel.key??"light");
  }

}