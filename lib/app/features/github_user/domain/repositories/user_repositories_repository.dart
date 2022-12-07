import 'package:dartz/dartz.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';

abstract class UserRepositoriesDomainRepository {
  Future<Either<Failure, List<RepositoryUser>>> getUserRepositories(
    String username,
  );
}
