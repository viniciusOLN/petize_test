import 'package:dartz/dartz.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';
import 'package:petize_test/app/features/github_user/domain/repositories/user_repository.dart';

class GetUserUsecase {
  final UserDomainRepository repository;

  GetUserUsecase({required this.repository});

  Future<Either<Failure, User>> getUser(String username) async {
    return await repository.getUserByUsername(username);
  }
}
