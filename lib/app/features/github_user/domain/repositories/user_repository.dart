import 'package:dartz/dartz.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';

abstract class UserDomainRepository {
  Future<Either<Failure, User>> getUserByUsername(String username);
}
