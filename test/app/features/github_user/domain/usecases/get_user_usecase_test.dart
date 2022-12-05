import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_test/app/core/error/failures.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';
import 'package:petize_test/app/features/github_user/domain/repositories/user_repository.dart';
import 'package:petize_test/app/features/github_user/domain/usecases/get_user_usecase.dart';

class MockUserDomainRepository extends Mock implements UserDomainRepository {}

void main() {
  MockUserDomainRepository repository = MockUserDomainRepository();
  GetUserUsecase usecase = GetUserUsecase(repository);
  const tUsername = 'teste';
  final tUser = User(
    imageUser: 'github.com/rawimages/a.png',
    username: 'teste245o',
    name: 'João',
    followers: 200,
    following: 50,
    bio: 'bio test',
    company: 'petize',
    location: 'São Paulo',
    email: 'teste@gmail.com',
    blog: 'teste.com.br',
    twitterUsername: 'teste123',
  );

  group('domain layer -> ', () {
    group('success | ', () {
      test(
        'should get user informations and repositories by a username',
        () async {
          when(() => repository.getUserByUsername(tUsername)).thenAnswer(
            (_) async {
              return Right(tUser);
            },
          );

          final result = await usecase.getUser(tUsername);
          expect(result, Right(tUser));
          verify(() => repository.getUserByUsername(tUsername));
          verifyNoMoreInteractions(repository);
        },
      );
    });

    group('failures | ', () {
      test(
        'should return a Generic Failure',
        () async {
          when(() => repository.getUserByUsername(tUsername)).thenAnswer(
            (_) async {
              return Left(GenericFailure());
            },
          );

          final result = await usecase.getUser(tUsername);

          expect(result, Left(GenericFailure()));
          verify(() => repository.getUserByUsername(tUsername));
          verifyNoMoreInteractions(repository);
        },
      );

      test(
        'should return a NotFound Failure',
        () async {
          when(() => repository.getUserByUsername(tUsername)).thenAnswer(
            (_) async {
              return Left(NotFoundFailure());
            },
          );

          final result = await usecase.getUser(tUsername);

          expect(result, Left(NotFoundFailure()));
          verify(() => repository.getUserByUsername(tUsername));
          verifyNoMoreInteractions(repository);
        },
      );
    });
  });
}
