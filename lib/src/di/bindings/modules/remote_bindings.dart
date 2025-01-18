import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:get/get.dart';
import '../../../data/remote/api/clients/dio_client.dart';
import '../../../data/remote/api/clients/rest_client.dart';
import '../../../data/remote/api/moduls/auth_api.dart';
import '../../../data/remote/api/app_api.dart';
import '../../../data/remote/constants/endpoints.dart';
import '../../../data/remote/remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteBindings extends Bindings {

  RemoteBindings();

  @override
  void dependencies() {

    Get.lazyPut<Dio>(() {
      final dio = Dio();
      dio
        ..options.baseUrl = Endpoints.baseUrl
        ..options.connectTimeout =  const Duration(milliseconds: Endpoints.connectionTimeout)
        ..options.receiveTimeout = const Duration(milliseconds: Endpoints.receiveTimeout)
//     ..options.headers = {'Content-Type':'application/json; charset=utf-8'}
//      ..options.responseType = ResponseType.bytes
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
        // ..interceptors.add(LogInterceptor(
        //     request: true,
        //     responseBody: true,
        //     requestBody: true,
        //     requestHeader: true,
        //     error: true
        // ))
        ..interceptors.add(
          InterceptorsWrapper(
              onRequest: (RequestOptions options,RequestInterceptorHandler handler) async {
                // getting shared pref instance
                var prefs = await SharedPreferences.getInstance();

                // getting token
                // var token = prefs.getString(Preferences.token);
                //Test token as it mentioned in the case study
                var token = "Bearer sj8355aivvpq97rq3r3lxvv207odee";
                var clientId = "e4040oh03abkhkgj5lm4zxt2uaetwj";
                // var token = null;
                print("tokenDioInstanse$token ");

                if (token != null) {
                  options.headers.putIfAbsent('Client-ID', () => clientId);
                  options.headers.putIfAbsent('Authorization', () => token);
                } else {
                  print('Auth token is null');
                }
                handler.next(options);
              },
              onError: (e, handler) {
                print(e.message);
                handler.next(e);
              },
              onResponse: (r, handler) {
                print(r.data);
                handler.next(r);
              }
          ),
        );

      return dio;
    },fenix: true);

    Get.lazyPut<DioClient>(() {
      return DioClient(Get.find());
    },fenix: true);

    Get.lazyPut<RestClient>(() {
      return RestClient();
    },fenix: true);

    Get.lazyPut<AppApi>(() {
      return AppApi(Get.find(),Get.find());
    },fenix: true);

    Get.lazyPut<AuthApi>(() {
      return AuthApi(Get.find(),Get.find());
    },fenix: true);

    Get.lazyPut<RemoteDataSource>(() {
      return RemoteDataSource(
          Get.find<AppApi>(),
          Get.find<AuthApi>(),
          );
    }, fenix: true);

  }
}