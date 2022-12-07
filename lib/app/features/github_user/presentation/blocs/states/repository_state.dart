import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';

abstract class RepositoryState {}

class RepositoryInitialState extends RepositoryState {}

class RepositoryLoadingState extends RepositoryState {}

class RepositorySuccessState extends RepositoryState {
  List<RepositoryUser> repository;
  RepositorySuccessState({required this.repository});
}

class RepositoryErrorState extends RepositoryState {
  final String message;

  RepositoryErrorState({required this.message});
}
