import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/features/auth/data/auth_repo.dart';
import 'package:igameapp/src/features/auth/data/constants/end_points.dart';
import 'package:igameapp/src/features/auth/presentation/screens/login/cubit/login_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {

  @Named('authDio')
  @lazySingleton
  Dio dioAuth() {
    final dio = Dio();
    dio
      ..options.baseUrl = EndpointsAuth.baseUrlAuth
      ..options.connectTimeout =
      const Duration(milliseconds: EndpointsAuth.connectionTimeout)
      ..options.receiveTimeout =
      const Duration(milliseconds: EndpointsAuth.receiveTimeout)
      ..interceptors.add(HttpFormatter(

        loggingFilter: (request, response, error) {
          // We don't want to print the request/response when 201 is returned
          // if (response?.statusCode == 201) {
          //   return false;
          // }
          // Otherwise, the logs should print
          return true;
        },

      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            handler.next(options);
          },
          onError: (e, handler) => handler.next(e),
          onResponse: (r, handler) => handler.next(r),
        ),
      );
    return dio;
  }

  @Named('authDioClient')
  @lazySingleton
  DioClient dioClientAuth(@Named('authDio') Dio dio) => DioClient(dio);

  @lazySingleton
  AuthRepo authRepo(@Named('authDioClient') DioClient dio,SharedPreferenceHelper sharedHelper){
    return AuthRepo(dio,sharedHelper);
  }

  @lazySingleton
  LoginCubit loginCubit(AuthRepo repo) =>
      LoginCubit(repo);
}
