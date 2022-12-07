abstract class UserEvent {
  String username;

  UserEvent({required this.username});
}

class ClosePopUpEvent extends UserEvent {
  ClosePopUpEvent({required super.username});
}

class SearchUserEvent extends UserEvent {
  SearchUserEvent({required super.username});
}

class SearchRepositoriesUserEvent extends UserEvent {
  SearchRepositoriesUserEvent({required super.username});
}
