import 'package:flutter_test/flutter_test.dart';
import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';

void main() {
  group('BaseResponse.fromJson', () {

    test('should parse direct Map response (LoginModel)', () {
      final json = {
        "access_token": "token123",
        "expires_in": 3600,
        "token_type": "bearer",
      };

      final response = BaseResponse<Map<String, dynamic>>.fromJson(
        json: json,
        fromJsonMapper: (map) => map,
      );

      expect(response.data, equals(json));
      expect(response.list, isNull);
    });

    test('should parse List response (List<GameModel>)', () {
      final json = [
        {"id": 1, "name": "Game 1"},
        {"id": 2, "name": "Game 2"},
      ];

      final response = BaseResponse<Map<String, dynamic>>.fromJson(
        json: json,
        fromJsonMapper: (map) => map,
      );

      expect(response.list?.length, 2);
      expect(response.data, isNull);
    });

    test('should parse nested response with dataKey', () {
      final json = {
        "status": "success",
        "data": {
          "id": 1,
          "name": "Test Game"
        }
      };

      final response = BaseResponse<Map<String, dynamic>>.fromJson(
        json: json,
        fromJsonMapper: (map) => map,
        dataKey: "data",
      );

      expect(response.data, equals(json["data"]));
      expect(response.list, isNull);
    });

    test('should handle null response', () {
      final response = BaseResponse<Map<String, dynamic>>.fromJson(
        json: null,
        fromJsonMapper: (map) => map,
      );

      expect(response.data, isNull);
      expect(response.list, isNull);
    });
  });
}