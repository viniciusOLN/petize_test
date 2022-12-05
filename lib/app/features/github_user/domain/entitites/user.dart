import 'package:equatable/equatable.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';

class User extends Equatable {
  String imageUser;
  String username;
  String name;
  int followers;
  int following;
  String bio;
  String company;
  String location;
  String email;
  String blog;
  String twitterUsername;
  List<RepositoryUser> repositoriesUser = [];

  User({
    required this.imageUser,
    required this.username,
    required this.name,
    required this.followers,
    required this.following,
    required this.bio,
    required this.company,
    required this.location,
    required this.email,
    required this.blog,
    required this.twitterUsername,
  });

  @override
  List<Object?> get props => [
        imageUser,
        username,
        name,
        followers,
        following,
        bio,
        company,
        location,
        email,
        blog,
        twitterUsername,
        repositoriesUser,
      ];
}
