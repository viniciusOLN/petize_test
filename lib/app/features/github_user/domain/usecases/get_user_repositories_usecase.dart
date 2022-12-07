import 'package:dartz/dartz.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';
import '../repositories/user_repositories_repository.dart';

class GetUserRepositoriesUsecase {
  final UserRepositoriesDomainRepository repository;

  GetUserRepositoriesUsecase({required this.repository});

  Future<Either<Failure, List<RepositoryUser>>> getUser(String username) async {
    return await repository.getUserRepositories(username);
  }
}
