abstract class RepositoryEvent {
  String username;

  RepositoryEvent({required this.username});
}

class SearchRepositoriesEvent extends RepositoryEvent {
  SearchRepositoriesEvent({required super.username});
}
