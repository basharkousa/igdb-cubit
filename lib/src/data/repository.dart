import 'models/base_api_response.dart';

class Repository extends BaseApiResponse {


  Repository();

  /* --------------------------------API METHODS------------------------------------- */

  //I Added to ways to call Api to show the differences between them here and in Controller and why I used Stream instead of Future.

/*  Future<BaseResponse<GameModel>> getGames(Map<String, dynamic> map) =>
      _remoteDataSource.getGames(map);

  Stream<ApiState<BaseResponse<GameModel>>> getGamesEasyWay(Map<String, dynamic> map) async * {
    yield ApiLoading();
    yield await safeApiCall(() => _remoteDataSource.getGames(map));
  }*/

  /* --------------------------------SHARED_PREFERENCES METHODS------------------------------------- */

  // Future<Locale> get fetchLocale => _localDataSource!.fetchLocale;
  //
  // Future<User> getUser() => _localDataSource!.getUser();
  //
  // Future<void> saveUser(User user) => _localDataSource!.saveUser(user);
  //
  // Future<void> removeUser() => _localDataSource!.removeUser();


}
