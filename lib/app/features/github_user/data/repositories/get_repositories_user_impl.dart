import 'package:petize_test/app/features/github_user/data/models/user_repositories_model.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/user_repositories_repository.dart';
import '../datasources/get_user_datasource.dart';

class GetUserRepositoriesImpl implements UserRepositoriesDomainRepository {
  final GetUserDatasource datasource;

  GetUserRepositoriesImpl({required this.datasource});

  @override
  Future<Either<Failure, List<RepositoryUser>>> getUserRepositories(
    String username,
  ) async {
    try {
      List<UserRepositoryModel> listUsers =
          await datasource.getUserRepositories(
        username,
      );
      return Right(listUsers);
    } catch (e) {
      if (e is NotFoundException) {
        return Left(NotFoundFailure());
      }
      return Left(GenericFailure());
    }
  }
}
