import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';

class UserRepositoriesModel extends RepositoryUser {
  UserRepositoriesModel({
    required super.name,
    required super.description,
    required super.updatedAt,
    required super.starsRepository,
  });

  factory UserRepositoriesModel.fromJson(Map<String, dynamic> json) {
    return UserRepositoriesModel(
      name: json['name'],
      description: json['description'] ?? 'Sem descrição',
      updatedAt: json['updated_at'],
      starsRepository: json['targazers_count'],
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
