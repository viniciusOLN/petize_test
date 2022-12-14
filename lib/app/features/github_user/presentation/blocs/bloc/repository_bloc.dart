import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:petize_test/app/features/github_user/domain/entitites/user_repositories.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/events/repository_event.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/states/repository_state.dart';
import 'package:petize_test/app/inject_dependencies.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entitites/user.dart';

class RepositoryBLoc extends Bloc<RepositoryEvent, RepositoryState> {
  final StreamController<RepositoryEvent> _inputUserController =
      StreamController<RepositoryEvent>();
  final StreamController<RepositoryState> _outputUserController =
      StreamController<RepositoryState>();
  late User user;
  String messageError = '';

  Sink<RepositoryEvent> get inputUser => _inputUserController.sink;
  Stream<RepositoryState> get stream => _outputUserController.stream;

  RepositoryBLoc(this.user) : super(RepositoryInitialState()) {
    _inputUserController.stream.listen(_mapEvent);
    _outputUserController.add(RepositoryInitialState());
  }

  _mapEvent(RepositoryEvent event) async {
    if (event is SearchRepositoriesEvent) {
      await getRepositories(event.username);
    }
  }

  List<RepositoryUser> _orderRepositories(List<RepositoryUser> repos) {
    List<RepositoryUser> ordenated = repos.toList();
    ordenated.sort((a, b) => b.starsRepository.compareTo(a.starsRepository));
    return ordenated;
  }

  getRepositories(String username) async {
    _outputUserController.add(RepositoryInitialState());
    final result = await GetUserContainer.usecaseRepositories.getUser(
      username,
    );
    result.fold((failure) {
      _handleError(failure);
    }, (repositories) {
      List<RepositoryUser> ordenatedRepositories = _orderRepositories(
        repositories,
      );

      user.repositoriesUser = ordenatedRepositories;

      _outputUserController.add(
        RepositorySuccessState(repository: user.repositoriesUser),
      );
    });
  }

  _handleError(Failure failure) {
    if (failure is NotFoundFailure) {
      messageError = 'Não foi possível encontrar o usuário!';
    }

    if (failure is GenericFailure) {
      messageError = 'Não foi possível realizar ação.';
    }
    _outputUserController.add(RepositoryErrorState(message: messageError));
  }
}
