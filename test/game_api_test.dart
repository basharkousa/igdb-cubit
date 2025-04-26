import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/features/game/domain/repositories/i_game_repo.dart';
import 'package:mockito/annotations.dart';

import 'game_api_test.mocks.dart';

@GenerateMocks([DioClient])
void main(){

  late MockDioClient mockDioClient;
  late IGameRepo iGameRepo;

  setUp((){
     mockDioClient = MockDioClient();
  });

}