import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/features/auth/data/models/login_model.dart';

abstract class IAuthRepo{

  Future<BaseResponse<LoginModel>> getTokenRequest(Map<String,dynamic> map);
  Future<void> saveToken(String token);
  String? getSavedToken();
  Future<void> removeToken(String token);
}