import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_test.mocks.dart';

@GenerateMocks([Dio])
void main() {

  group('DioClient', () {
    late Dio mockDio;
    late DioClient dioClient;

    setUp(() {
      mockDio = MockDio();
      dioClient = DioClient(mockDio);
    });

    test('GET returns data on success', () async {
      // Arrange
      when(mockDio.get(
        '/test',
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => Response(
        data: {'key': 'value'},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      ));

      // Act
      final result = await dioClient.get('/test');

      // Assert
      expect(result, equals({'key': 'value'}));
      verify(mockDio.get('/test')).called(1);
    });

    test('GET throws exception on error', () async {
      // Arrange
      when(mockDio.get(any??"")).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/test'),
      ));

      // Act & Assert
      expect(() => dioClient.get('/test'), throwsA(isA<DioException>()));
    });
  });


}