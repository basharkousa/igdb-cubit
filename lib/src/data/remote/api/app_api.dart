import 'dart:async';
import 'dart:convert';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/remote/api/app_api_interface.dart';
import 'package:igameapp/src/data/remote/constants/endpoints.dart';

import '../../remote/api/clients/dio_client.dart';
import '../../remote/api/clients/rest_client.dart';

class AppApi implements IAppApi{
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  AppApi(this._dioClient, this._restClient);

  @override
  Future<BaseResponse<GameModel>> getGamesRequest(Map<String, dynamic> map) async {
    map["fields"] = "*,cover.*,screenshots.*,videos.*,genres.*,player_perspectives.*";
    final res = await _dioClient.get(Endpoints.games,
        queryParameters: map);
    return BaseResponse<GameModel>.fromJson(json: res,fromJsonMapper: GameModel.fromJson);
  }

}
