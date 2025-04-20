import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/core/data/remote/api/clients/rest_client.dart';
import 'package:igameapp/src/core/data/remote/constants/endpoints.dart';
import 'package:igameapp/src/core/di/getit/injection.dart';
import 'package:igameapp/src/features/auth/data/auth_repo.dart';
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
            //expired one
            // final token =
            //     "Bearer sj8355aivvpq97rq3r3lxvv207odee"; // Use prefs or default

            final token = getIt<AuthRepo>().getSavedToken();
            final clientId = "e4040oh03abkhkgj5lm4zxt2uaetwj";

            if (token != null) {
              options.headers.putIfAbsent('Client-ID', () => clientId);
              // options.headers['Authorization'] = "Bearer $token";
              // options.headers['Authorization'] = "Bearer sj8355aivvpq97rq3r3lxvv207odee";
              options.headers
                  .putIfAbsent('Authorization', () => "Bearer $token");
            }
            handler.next(options);
          },
          onError: (e, handler) async {
            // Handle 401 Unauthorized errors specifically
            if (e.response?.statusCode == 401) {
              try {
                // Attempt to refresh token
                final newToken = await getIt<AuthRepo>().getTokenRequest({
                  "client_id": "e4040oh03abkhkgj5lm4zxt2uaetwj",
                  "client_secret": "gjegyegavt770s288il8vlrdu41f78"
                });

                // Update the request with new token
                e.requestOptions.headers['Authorization'] = 'Bearer ${newToken.data?.accessToken}';

                // Repeat the request with new token
                final response = await dio.fetch(e.requestOptions);
                return handler.resolve(response);
              } catch (refreshError) {
                // If refresh fails, propagate the error
                if (refreshError is DioException) {
                  return handler.next(refreshError);
                }
                return handler.next(e);
              }
            }
            return handler.next(e);
          },
          onResponse: (r, handler) => handler.next(r),
        ),
      );
    return dio;
  }

  @lazySingleton
  DioClient dioClient(Dio dio) => DioClient(dio);

  @lazySingleton
  RestClient get restClient => RestClient();
}
