import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/core/data/remote/constants/endpoints.dart';
import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_dao.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_favorite_dao.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'game_repo_test.mocks.dart';

@GenerateMocks([Dio,DioClient,GameDao,GameFavoriteDao])
void main() {

  group('GameRepo', () {
    late MockDioClient mockDioClient;
    late MockGameDao mockGameDao;
    late GameRepo gameRepo;
    late GameFavoriteDao gameFavoriteDao;

    setUp(() {
      mockDioClient = MockDioClient();
      mockGameDao = MockGameDao();
      gameFavoriteDao = MockGameFavoriteDao();
      gameRepo = GameRepo(mockDioClient, mockGameDao,gameFavoriteDao);
    });

    test('getGames returns BaseResponse with GameModel', () async {
      // Arrange
      final mockResponse = {
        "data": {
          "id": 123,
          "name": "Test Game",
          "cover": {"url": "test.jpg"}
        }
      };

      when(mockDioClient.get(
        Endpoints.games,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await gameRepo.getGames({});

      // Assert
      expect(result, isA<BaseResponse<GameModel>>());
      expect(result.data?.id, equals(123));
      verify(mockDioClient.get(
        Endpoints.games,
        queryParameters: {
          "fields": "*,cover.*,screenshots.*,videos.*,genres.*,player_perspectives.*"
        },
      )).called(1);
    });

    test('getGames propagates Dio errors', () async {
      // Arrange
      when(mockDioClient.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: Endpoints.games),
      ));

      // Act & Assert
      expect(() => gameRepo.getGames({}), throwsA(isA<DioException>()));
    });
  });

}