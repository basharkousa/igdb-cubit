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
      if (response != null) return ApiState.completed(response);
      return ApiState.error("some Error");
    } on DioException catch (error, stacktrace) {
      print('DioError:$error $stacktrace');
      return ApiState.error(DioErrorUtil.handleError(error));
    } catch (error, stacktrace) {
      print('Error:$error $stacktrace');
      return ApiState.error(error.toString());
    }
  }

}
