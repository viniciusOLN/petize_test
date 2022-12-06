import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:petize_test/app/features/github_user/data/models/user_repositories_model.dart';

import '../../../../../fixtures/fixture.dart';

void main() {
  group('repositoryUser | ', () {
    final json = jsonDecode(fixture('repositories_data.json'));
    test('should return an instance from a json', () {
      final userModel = UserRepositoryModel.fromJson(json);

      expect(userModel, isA<UserRepositoryModel>());
    });

    test('should return a json from an instance', () {
      final userModel = UserRepositoryModel.fromJson(json);
      final userJson = userModel.toJson();

      expect(userJson, isA<Map<String, dynamic>>());
    });
  });
}
