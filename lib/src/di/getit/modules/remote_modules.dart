import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:igameapp/src/data/remote/api/app_api.dart';
import 'package:igameapp/src/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/data/remote/api/clients/rest_client.dart';
import 'package:igameapp/src/data/remote/api/moduls/auth_api.dart';
import 'package:igameapp/src/data/remote/constants/endpoints.dart';
import 'package:igameapp/src/data/remote/remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RemoteModule {

  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout =
          const Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(milliseconds: Endpoints.receiveTimeout)
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
            final prefs = await SharedPreferences.getInstance();
            final token = prefs.getString('token') ??
                "Bearer sj8355aivvpq97rq3r3lxvv207odee"; // Use prefs or default
            final clientId = "e4040oh03abkhkgj5lm4zxt2uaetwj";

            if (token != null) {
              options.headers.putIfAbsent('Client-ID', () => clientId);
              options.headers.putIfAbsent('Authorization', () => token);
            }
            handler.next(options);
          },
          onError: (e, handler) => handler.next(e),
          onResponse: (r, handler) => handler.next(r),
        ),
      );
    return dio;
  }

  @lazySingleton
  DioClient dioClient(Dio dio) => DioClient(dio);

  @lazySingleton
  RestClient get restClient => RestClient();

  @lazySingleton
  AppApi appApi(DioClient dioClient, RestClient restClient) =>
      AppApi(dioClient, restClient);


  @lazySingleton
  AuthApi authApi(DioClient dioClient, RestClient restClient) =>
      AuthApi(dioClient, restClient);

  @lazySingleton
  RemoteDataSource remoteDataSource(
      AppApi appApi, AuthApi authApi) =>
      RemoteDataSource(appApi, authApi);
}
