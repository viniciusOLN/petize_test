import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:petize_test/app/features/github_user/data/models/user_model.dart';

import '../../../../../fixtures/fixture.dart';

void main() {
  group('userModel | ', () {
    final json = jsonDecode(fixture('user_data.json'));
    test('should return an instance from a json', () {
      final userModel = UserModel.fromJson(json);

      expect(userModel, isA<UserModel>());
    });

    test('should return a json from an instance', () {
      final userModel = UserModel.fromJson(json);
      final userJson = userModel.toJson();

      expect(userJson, isA<Map<String, dynamic>>());
    });
  });
}
