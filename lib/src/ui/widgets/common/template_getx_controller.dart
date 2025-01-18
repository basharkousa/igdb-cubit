// import 'package:get/get.dart';
// import 'package:bobmint_app/src/data/repository.dart';
//
// // with SingleGetTickerProviderMixin
// class TemplateGetXController extends GetxController{
//
//   final Repository repository = Get.find();
//
//  // var someLiveData = ApiResponse<Model>.loading("message").obs;
//
//   TemplateGetXController();
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   callSomeApi() async {
//     odooTokenLiveData.value = ApiResponse.loading('');
//     try {
//       UserOdooResponse odooTokenResponse = await repository.getOdooUserToken();
//       odooTokenLiveData.value = ApiResponse.completed(odooTokenResponse);
//
//     }on DioError catch (error, stacktrace) {
//       odooTokenLiveData.value =
//           ApiResponse.error(DioErrorUtil.handleError(error));
//       print('$error $stacktrace');
//     }catch (error, stacktrace) {
//       odooTokenLiveData.value = ApiResponse.error(error.toString());
//       print('Error:$error $stacktrace');
//     }
//   }
//
// }
