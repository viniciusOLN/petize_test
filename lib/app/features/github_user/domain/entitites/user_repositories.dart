import 'package:equatable/equatable.dart';

class RepositoryUser extends Equatable {
  String name;
  String description;
  String updatedAt;
  int starsRepository;

  RepositoryUser({
    required this.name,
    required this.description,
    required this.updatedAt,
    required this.starsRepository,
  });

  @override
  List<Object?> get props => [name, description, updatedAt, starsRepository];
}
