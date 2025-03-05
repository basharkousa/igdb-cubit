import 'package:dio/dio.dart';
import '../../data/models/api_state.dart';
import '../../data/models/state_result.dart';
import '../remote/exceptions/dio_error_util.dart';

abstract class BaseApiResponse {

  Future<StateResult<T>> safeApiCallNew<T>(Future<T> Function() apiCall) async {
    try {
      var response = await apiCall();
      if (response != null) return SuccessState(response);
      return ErrorState("some Error");
    } on DioException catch (error, stacktrace) {
      print("DioException: $error ---$stacktrace");
      return ErrorState(DioErrorUtil.handleError(error));
    } catch (error, stacktrace) {
      print("Error: $error ---$stacktrace");
      return ErrorState(error.toString());
    }
  }

  Future<ApiState<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      var response = await apiCall();
      if (response != null) return ApiCompleted(response);
      return ApiError("some Error");
    } on DioException catch (error, stacktrace) {
      print('DioError:$error $stacktrace');
      return ApiError(DioErrorUtil.handleError(error)??"Error");
    } catch (error, stacktrace) {
      print('Error:$error $stacktrace');
      return ApiError(error.toString());
    }
  }

}
