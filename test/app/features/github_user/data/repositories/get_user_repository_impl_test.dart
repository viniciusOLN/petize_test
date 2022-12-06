import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_test/app/core/error/exceptions.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:petize_test/app/features/github_user/data/datasources/get_user_datasource.dart';
import 'package:petize_test/app/features/github_user/data/models/user_model.dart';
import 'package:petize_test/app/features/github_user/data/repositories/get_user_repository_impl.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';
import '../../../../../fixtures/fixture.dart';

class MockDatasource extends Mock implements GetUserDatasource {}

void main() {
  final datasource = MockDatasource();
  final repository = GetUserRepositoryImpl(datasource: datasource);
  final tUserModel = UserModel.fromJson(jsonDecode(fixture('user_data.json')));
  User tUser = tUserModel;
  const tName = 'viniciusOLN';

  void testFailures({
    required String describe,
    required Exception exception,
    required Failure failure,
  }) {
    test(describe, () async {
      when(() => datasource.getUserByUsername(tName)).thenThrow(exception);

      final response = await repository.getUserByUsername(tName);

      verify(() => datasource.getUserByUsername(tName));
      expect(response, equals(Left(failure)));
    });
  }

  group('data repository => ', () {
    group('requisition | ', () {
      test('should get a user from the datasource', () async {
        when(() => datasource.getUserByUsername(tName)).thenAnswer((_) async {
          return tUserModel;
        });

        final response = await repository.getUserByUsername(tName);

        verify(() => datasource.getUserByUsername(tName));
        expect(response, equals(Right(tUser)));
      });
    });

    group('failures | ', () {
      testFailures(
        describe: 'should return a NotFound Failure',
        exception: NotFoundException(),
        failure: NotFoundFailure(),
      );

      testFailures(
        describe: 'should return a Generic Failure',
        exception: GenericException(),
        failure: GenericFailure(),
      );
    });
  });
}
