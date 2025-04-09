import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/features/auth/data/constants/end_points.dart';
import 'package:igameapp/src/features/auth/data/models/login_model.dart';
import 'package:igameapp/src/features/auth/domain/i_auth_repo.dart';

class AuthRepo implements IAuthRepo {
  final DioClient _dioClient;

  AuthRepo(this._dioClient);

  @override
  Future<BaseResponse<LoginModel>> getToken(Map<String, dynamic> map) async {
    final response = await _dioClient.post(EndpointsAuth.token, data: map);
    return BaseResponse<LoginModel>.fromJson(
        json: response, fromJsonMapper: LoginModel.fromJson);
  }
}
