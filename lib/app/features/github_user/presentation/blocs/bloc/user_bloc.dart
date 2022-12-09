import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/events/user_event.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/states/user_state.dart';
import 'package:petize_test/app/inject_dependencies.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entitites/user.dart';
import '../../infos_user/infos_user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final StreamController<UserEvent> _inputUserController =
      StreamController<UserEvent>();
  final StreamController<UserState> _outputUserController =
      StreamController<UserState>();
  late User user;
  String messageError = '';
  String usernameSearch = '';

  Sink<UserEvent> get inputUser => _inputUserController.sink;
  Stream<UserState> get stream => _outputUserController.stream;

  UserBloc() : super(UserInitialState()) {
    _outputUserController.add(UserInitialState());
  }

  getUser(String name, BuildContext context, UserBloc bloc) async {
    final userOrError = await GetUserContainer.usecase.getUser(
      name,
    );

    userOrError.fold((failure) {
      _handleError(failure);
    }, (userReturn) {
      user = userReturn;
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return InfosUser(bloc: bloc);
      }));
      _outputUserController.add(UserSuccessState(user: user));
    });
  }

  _handleError(Failure failure) {
    if (failure is NotFoundFailure) {
      messageError = 'Não foi possível encontrar o usuário!';
    }

    if (failure is GenericFailure) {
      messageError = 'Não foi possível realizar ação.';
    }
    _outputUserController.add(UserErrorState(message: messageError));
  }
}
