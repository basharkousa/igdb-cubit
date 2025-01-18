import 'package:dio/dio.dart';
import '../../constants/endpoints.dart';
import '../../../models/user/user.dart';
import '../../api/clients/dio_client.dart';
import '../clients/rest_client.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;
  DioClient get dioClient => _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  AuthApi(this._dioClient, this._restClient);

}
