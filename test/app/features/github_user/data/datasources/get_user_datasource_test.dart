import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:petize_test/app/core/error/exceptions.dart';
import 'package:petize_test/app/features/github_user/data/datasources/get_user_datasource.dart';
import 'package:petize_test/app/features/github_user/data/models/user_model.dart';

import '../../../../../fixtures/fixture.dart';

class MockHttp extends Mock implements http.Client {}

void main() {
  final client = MockHttp();
  final datasource = GetUserDatasourceImpl(client: client);
  const username = 'viniciusOLN';

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  http.Response mockDioToReturnJsonStatusCode200() {
    return http.Response(fixture('user_data.json'), 200);
  }

  http.Response mockDioToReturnJsonStatusCode(int statusCode) {
    return http.Response('', statusCode);
  }

  void testException({
    required String describe,
    required int statusCode,
    required Exception exception,
  }) {
    test(
      describe,
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async => mockDioToReturnJsonStatusCode(statusCode),
        );

        final result = datasource.getUserByUsername(username);

        await expectLater(() => result, throwsA(equals(exception)));
      },
    );
  }

  group('datasource layer -> ', () {
    group('requisitions | ', () {
      test(
        'should make a requisition to github api',
        () async {
          when(() => client.get(any())).thenAnswer(
            (_) async => mockDioToReturnJsonStatusCode200(),
          );

          final result = await datasource.getUserByUsername(username);

          verify(
            () =>
                client.get(Uri.parse('https://api.github.com/users/$username')),
          );
        },
      );

      test(
        'should return a UserModel from data of github api',
        () async {
          when(() => client.get(any())).thenAnswer(
            (_) async => mockDioToReturnJsonStatusCode200(),
          );

          final result = await datasource.getUserByUsername(username);

          expect(result, isA<UserModel>());
        },
      );
    });

    group('exceptions | ', () {
      testException(
        describe: 'should return a NotFound Exception',
        statusCode: 404,
        exception: NotFoundException(),
      );

      testException(
        describe: 'should return a Generic Exception',
        statusCode: 500,
        exception: GenericException(),
      );
    });
  });
}
