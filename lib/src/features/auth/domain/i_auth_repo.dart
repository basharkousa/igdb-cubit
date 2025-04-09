import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/features/auth/data/models/login_model.dart';

abstract class IAuthRepo{
  Future<BaseResponse<LoginModel>> getToken(Map<String,dynamic> map);
}