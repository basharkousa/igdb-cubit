import 'package:dio/dio.dart';
import 'package:igameapp/src/data/models/errorappmodel/error_app_model.dart';
import 'package:igameapp/src/utils/basic_tools.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------

  static String? handleError(DioException error) {
    String? errorDescription = "";
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioExceptionType.unknown:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          try {
            //todo we must add Error model which is related to Api error response api
            ErrorAppModel errorappmodel =
            ErrorAppModel.fromJson(error.response!.data!);

            errorDescription = "${errorappmodel.error}";
          } catch (error, stacktrace) {
            print("DioExceptionTypeBadResponse $error $stacktrace");
          }
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad Certificate!!";
          break;
        case DioExceptionType.connectionError:
          errorDescription =
              "Connection to API server failed due to connection error!!";
          BasicTools.showToastMessage(errorDescription);
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred!!";
    }
    return errorDescription;
  }
}
