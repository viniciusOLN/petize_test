import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';

class UserRepositoryModel extends RepositoryUser {
  UserRepositoryModel({
    required super.name,
    required super.description,
    required super.updatedAt,
    required super.starsRepository,
  });

  factory UserRepositoryModel.fromJson(Map<String, dynamic> json) {
    return UserRepositoryModel(
      name: json['name'],
      description: json['description'] ?? 'Sem descrição',
      updatedAt: json['updated_at'],
      starsRepository: json['stargazers_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'updatedAt': updatedAt,
      'starsRepository': starsRepository,
    };
  }
}
