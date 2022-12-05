import 'package:petize_test/app/features/github_user/domain/entitites/user.dart';

class UserModel extends User {
  UserModel({
    required super.imageUser,
    required super.username,
    required super.name,
    required super.followers,
    required super.following,
    required super.bio,
    required super.company,
    required super.location,
    required super.email,
    required super.blog,
    required super.twitterUsername,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      imageUser: json['avatar_url'] ?? '',
      username: json['login'] ?? '',
      name: json['name'] ?? '',
      followers: json['followers'] ?? '',
      following: json['following'] ?? '',
      bio: json['bio'] ?? '',
      company: json['company'] ?? '',
      location: json['location'] ?? 'Não informado',
      email: json['email'] ?? '',
      blog: json['blog'] ?? '',
      twitterUsername: json['twitter_username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUser': imageUser,
      'username': username,
      'followers': followers,
      'following': following,
      'bio': bio,
      'company': company,
      'location': location,
      'email': email,
      'blog': blog,
      'twitterUsername': twitterUsername,
      'repositories': repositoriesUser,
    };
  }
}
