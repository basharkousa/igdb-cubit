// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:igameapp/src/features/game/data/local/floor/entity/game_entity.dart';
// import 'package:igameapp/src/features/game/domain/models/cover.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:igameapp/src/core/data/models/BaseResponse.dart';
// import 'package:igameapp/src/features/game/data/game_repo.dart';
// import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
// import 'package:igameapp/src/features/game/domain/models/game.dart';
// import 'package:igameapp/src/features/game/domain/remove_local_games_usecase.dart';
// import 'package:igameapp/src/features/game/domain/games_no_connection_usecase.dart';
//
// import 'games_no_connection_usecase_test.mocks.dart';
//
// // Generate mocks
// @GenerateMocks([GameRepo, RemoveLocalGamesUseCase])
//
// void main() {
//   late GamesNoConnectionUseCase useCase;
//   late MockGameRepo mockGameRepo;
//   late MockRemoveLocalGamesUseCase mockRemoveLocalGamesUseCase;
//
//   final testGameModel = GameModel(
//     id: 1,
//     name: 'Test Game',
//     // Add other required fields
//   );
//
//   final testGame = Game(
//     id: 1,
//     name: 'Test Game',
//     isFavourite: false,
//     screenshots: [],
//     cover: Cover(url: "", imageId: ""),
//     ratings: 0,
//     summary: ""
//   );
//
//   setUp(() {
//     mockGameRepo = MockGameRepo();
//     mockRemoveLocalGamesUseCase = MockRemoveLocalGamesUseCase();
//     useCase = GamesNoConnectionUseCase(mockGameRepo, mockRemoveLocalGamesUseCase);
//   });
//
//   group('Successful API Response', () {
//     test('should return games from API and update local storage', () async {
//       // Arrange
//       final mockResponse = BaseResponse<GameModel>(
//         list: [testGameModel],
//       );
//
//       when(mockGameRepo.getGames(any))
//           .thenAnswer((_) async => mockResponse);
//       when(mockGameRepo.isGameFavorite(any)).thenAnswer((_) async => false);
//       when(mockRemoveLocalGamesUseCase()).thenAnswer((_) async => {});
//
//       // Act
//       final result = await useCase.call({});
//
//       // Assert
//       expect(result, [testGame]);
//       verify(mockGameRepo.getGames(any)).called(1);
//       verify(mockRemoveLocalGamesUseCase()).called(1);
//       verify(mockGameRepo.addGames([testGameModel])).called(1);
//       verify(mockGameRepo.isGameFavorite(1)).called(1);
//     });
//   });
//
//   group('DioException Handling', () {
//     test('should return local games when API fails with DioException', () async {
//       // Arrange
//       final dioError = DioException(
//         requestOptions: RequestOptions(path: '/'),
//         response: Response(
//           requestOptions: RequestOptions(path: '/'),
//           statusCode: 500,
//         ),
//       );
//
//       when(mockGameRepo.getGames(any))
//           .thenThrow(dioError);
//       when(mockGameRepo.getLocalGames())
//           .thenAnswer((_) async => [GameEntity.fromGameModel(testGameModel)]);
//       when(mockGameRepo.isGameFavorite(any))
//           .thenAnswer((_) async => false);
//
//       // Act
//       final result = await useCase.call({});
//
//       // Assert
//       expect(result, [testGame]);
//       verify(mockGameRepo.getGames(any)).called(1);
//       verify(mockGameRepo.getLocalGames()).called(1);
//       verifyNever(mockRemoveLocalGamesUseCase());
//       verifyNever(mockGameRepo.addGames(any));
//     });
//
//     test('should show toast message on DioException', () async {
//       // Arrange
//       final dioError = DioException(
//         requestOptions: RequestOptions(path: '/'),
//         response: Response(
//           requestOptions: RequestOptions(path: '/'),
//           statusCode: 404,
//         ),
//       );
//
//       when(mockGameRepo.getGames(any))
//           .thenThrow(dioError);
//       when(mockGameRepo.getLocalGames())
//           .thenAnswer((_) async => []);
//
//       // Act
//       final result = await useCase.call({});
//
//       // Assert
//       expect(result, isEmpty);
//       // Here you would verify toast message was shown
//       // This might require mocking your BasicTools or using a service locator
//     });
//   });
//
//   group('Other Exception Handling', () {
//     test('should return local games when generic exception occurs', () async {
//       // Arrange
//       when(mockGameRepo.getGames(any))
//           .thenThrow(Exception('Generic error'));
//       when(mockGameRepo.getLocalGames())
//           .thenAnswer((_) async => [testGameModel]);
//       when(mockGameRepo.isGameFavorite(any))
//           .thenAnswer((_) async => false);
//
//       // Act
//       final result = await useCase.call({});
//
//       // Assert
//       expect(result, [testGame]);
//       verify(mockGameRepo.getLocalGames()).called(1);
//     });
//   });
//
//   group('Edge Cases', () {
//     test('should handle empty API response', () async {
//       // Arrange
//       final mockResponse = BaseResponse<GameModel>(list: []);
//
//       when(mockGameRepo.getGames(any))
//           .thenAnswer((_) async => mockResponse);
//       when(mockRemoveLocalGamesUseCase()).thenAnswer((_) async => {});
//
//       // Act
//       final result = await useCase.call({});
//
//       // Assert
//       expect(result, isEmpty);
//       verify(mockGameRepo.addGames([])).called(1);
//     });
//
//     test('should handle null favorite status', () async {
//       // Arrange
//       final mockResponse = BaseResponse<GameModel>(list: [testGameModel]);
//
//       when(mockGameRepo.getGames(any))
//           .thenAnswer((_) async => mockResponse);
//       when(mockGameRepo.isGameFavorite(any))
//           .thenAnswer((_) async => null); // Simulate null response
//
//       // Act
//       final result = await useCase.call({});
//
//       // Assert
//       expect(result.first.isFavorite, isFalse); // Default value
//     });
//   });
// }