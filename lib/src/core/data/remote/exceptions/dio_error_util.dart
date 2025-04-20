import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------

  static String handleError(DioException error) {
    if (error.response != null && error.response!.data != null) {
      try {
        final data = error.response!.data;
        if (data is Map<String, dynamic>) {
          // Handle specific API error messages
          if (data.containsKey('message')) {
            final message = data['message'] as String;
            final tips = data.entries
                .where((e) => e.key.startsWith('Tip'))
                .map((e) => '${e.key}: ${e.value}')
                .join('\n');

            return '$message\n$tips';
          }
        }

        // Fallback to status code based messages
        switch (error.response?.statusCode) {
          case 400:
            return 'Bad request';
          case 401:
            return 'Session expired. Please login again.';
          case 403:
            return 'Unauthorized access';
          case 404:
            return 'Resource not found';
          case 500:
            return 'Internal server error';
          default:
            return 'An error occurred (${error.response?.statusCode})';
        }
      } catch (e) {
        return _getDefaultMessage(error);
      }
    }
    return _getDefaultMessage(error);
  }

  static String _getDefaultMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "Request cancelled";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout";
      case DioExceptionType.unknown:
        return "No internet connection";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout";
      case DioExceptionType.badResponse:
        return "Invalid server response";
      case DioExceptionType.sendTimeout:
        return "Send timeout";
      case DioExceptionType.badCertificate:
        return "Invalid security certificate";
      case DioExceptionType.connectionError:
        return "Connection error";
      default:
        return "An unexpected error occurred";
    }
  }

//The Old One
/*static String? handleError(DioException error) {
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
            print("ErrorHere");

            BaseResponse errorappmodel =
            BaseResponse.fromJson(json: error.response!.data!,);
            errorDescription = "${errorappmodel.data["message"]}";
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
  }*/
}
