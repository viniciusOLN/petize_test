import 'package:petize_test/app/features/github_user/data/datasources/get_user_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:petize_test/app/features/github_user/data/repositories/get_user_repository_impl.dart';
import 'package:petize_test/app/features/github_user/domain/usecases/get_user_usecase.dart';

import 'features/github_user/data/repositories/get_repositories_user_impl.dart';
import 'features/github_user/domain/repositories/user_repositories_repository.dart';
import 'features/github_user/domain/usecases/get_user_repositories_usecase.dart';

class GetUserContainer {
  static GetUserDatasourceImpl datasource = GetUserDatasourceImpl(
    client: http.Client(),
  );

  static GetUserRepositoryImpl repository = GetUserRepositoryImpl(
    datasource: datasource,
  );
  static GetUserUsecase usecase = GetUserUsecase(
    repository: repository,
  );

  static GetUserRepositoriesImpl userRepositoriesRepository =
      GetUserRepositoriesImpl(
    datasource: datasource,
  );

  static GetUserRepositoriesUsecase usecaseRepositories =
      GetUserRepositoriesUsecase(
    repository: userRepositoriesRepository,
  );
}
