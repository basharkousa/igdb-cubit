import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/features/auth/data/constants/end_points.dart';
import 'package:igameapp/src/features/auth/data/models/login_model.dart';
import 'package:igameapp/src/features/auth/domain/i_auth_repo.dart';

class AuthRepo implements IAuthRepo {
  final DioClient _dioClient;
  final SharedPreferenceHelper _sharedPreferenceHelper;

  AuthRepo(this._dioClient,this._sharedPreferenceHelper);

  @override
  Future<BaseResponse<LoginModel>> getTokenRequest(Map<String, dynamic> map) async {
    map["grant_type"] = "client_credentials";

    final response = await _dioClient.post(EndpointsAuth.token, data: map);

    await saveToken(response.data?.accessToken);

    return BaseResponse<LoginModel>.fromJson(
        json: response, fromJsonMapper: LoginModel.fromJson);
  }

  @override
  Future<void> saveToken(String? token) async => await _sharedPreferenceHelper.setToken(token);

  @override
  String? getSavedToken() => _sharedPreferenceHelper.token;

  @override
  Future<void> removeToken(String token)=> _sharedPreferenceHelper.removeToken();



}
