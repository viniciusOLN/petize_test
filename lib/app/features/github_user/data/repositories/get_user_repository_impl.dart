import 'package:petize_test/app/core/error/exceptions.dart';
import 'package:petize_test/app/features/github_user/data/datasources/get_user_datasource.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:petize_test/app/features/github_user/domain/repositories/user_repository.dart';

class GetUserRepositoryImpl implements UserDomainRepository {
  final GetUserDatasource datasource;

  GetUserRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, User>> getUserByUsername(String username) async {
    try {
      final userModel = await datasource.getUserByUsername(username);
      return Right(userModel);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(GenericFailure());
    }
  }
}
