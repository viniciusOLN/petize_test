import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  User user;
  UserSuccessState({required this.user});
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({required this.message});
}
