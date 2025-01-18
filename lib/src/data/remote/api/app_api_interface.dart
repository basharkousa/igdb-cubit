import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';

abstract class IAppApi{
  Future<BaseResponse<GameModel>> getGamesRequest(Map<String, dynamic> map);
}