import 'dart:convert';
import 'package:petize_test/app/core/error/exceptions.dart';
import 'package:petize_test/app/features/github_user/data/models/user_model.dart';
import 'package:petize_test/app/features/github_user/data/models/user_repositories_model.dart';
import 'package:http/http.dart' as http;
import 'package:petize_test/app/utils/api_routes.dart';

abstract class GetUserDatasource {
  Future<UserModel> getUserByUsername(String username);
  Future<List<UserRepositoryModel>> getUserRepositories(String username);
}

class GetUserDatasourceImpl implements GetUserDatasource {
  final http.Client client;

  GetUserDatasourceImpl({required this.client});

  @override
  Future<UserModel> getUserByUsername(String username) async {
    final json = await _requisition('${Url.base}$username');
    return UserModel.fromJson(json);
  }

  @override
  Future<List<UserRepositoryModel>> getUserRepositories(String username) async {
    List<UserRepositoryModel> listRepositories = [];

    final json = await _requisition('${Url.base}$username${Url.repos}');
    json
        .map((item) => listRepositories.add(UserRepositoryModel.fromJson(item)))
        .toList();

    return listRepositories;
  }

  Future _requisition(String url) async {
    http.Response response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }

    throw Exceptions.handleException(response.statusCode);
  }
}
