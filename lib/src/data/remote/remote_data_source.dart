import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import '../models/user/user.dart';
import 'api/moduls/auth_api.dart';
import 'api/app_api.dart';


class RemoteDataSource {

  final AppApi _appApi;

  //Here if we want to add more modules
  final AuthApi _authApi;

  RemoteDataSource(
      this._appApi,
      this._authApi,
);

  Future<BaseResponse<GameModel>> getGames(Map<String, dynamic> map) => _appApi.getGamesRequest(map);


}
