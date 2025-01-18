import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/api_state.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/remote/exceptions/dio_error_util.dart';
import '../../src/data/repository.dart';

// SingleGetTickerProviderMixin
class AppController extends GetxController with GetTickerProviderStateMixin {
  final Repository repository;

  static AppController controller = Get.find();

  AppController(this.repository);


  RxBool isUserClientLoggedIn = false.obs;



  @override
  void onInit() async {
    print('AppController_init()');
    listenToFirebase();
    super.onInit();
  }

  @override
  void dispose() {
    // tabController!.dispose();
    super.dispose();
  }

  //todo remove: it is just an example
  void listenToFirebase() async {}

  logOutUser() async {
    await repository.removeUser();
    repository.getUser().then((user) {
      print('AfterLogoutUser: ${user.toString()}');
    });
    isUserClientLoggedIn.value = false;
    // _handleLogoutExternalUserId();
    // Get.offAllNamed(HomePage.homePageRoute);
  }

  checkUserLogin({required Function? isLogged, Function? isNotLogged}) {
    if (isUserClientLoggedIn.value) {
      isLogged!();
    } else {
      //isNotLogged();
      // Get.toNamed(LoginPage.loginPageRoute);
    }
  }


  //Here Just Elaboration for how can we Call apis in the app
  var gamesResponseLiveData = ApiState<BaseResponse<GameModel>>.loading().obs;
  //I Added to ways to call Api to show the differences between them here and in Repository.
  getGamesEasyWay() {
    var map = {"":""};
    repository.getGamesEasyWay(map).listen((event) {
      gamesResponseLiveData.value = event;
    });
  }
  getGames() async {
    gamesResponseLiveData.value = ApiState.loading();
    try {
      var map = {"":""};
      BaseResponse<GameModel> projectsResponse = await repository.getGames(map);
      gamesResponseLiveData.value = ApiState.completed(projectsResponse);
    } on DioException catch (error, stacktrace) {
      gamesResponseLiveData.value =
          ApiState.error(DioErrorUtil.handleError(error));
      print('DioException$error $stacktrace');
    } catch (error, stacktrace) {
      gamesResponseLiveData.value = ApiState.error(error.toString());
      print('OtherException:$error $stacktrace');
    }
  }
}
