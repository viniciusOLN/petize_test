import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/bloc/repository_bloc.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/bloc/user_bloc.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/events/repository_event.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/states/repository_state.dart';
import 'package:petize_test/app/utils/widgets/loading_transparent.dart';
import 'widgets/infos_user.dart';
import 'widgets/repositories_column.dart';

class InfosUser extends StatelessWidget {
  UserBloc bloc;
  InfosUser({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositoryBLoc blocRepository = RepositoryBLoc(bloc.user);
    blocRepository.inputUser.add(
      SearchRepositoriesEvent(username: bloc.user.username),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              InfosUserWidget(
                user: bloc.user,
              ),
              BlocBuilder<RepositoryBLoc, RepositoryState>(
                bloc: blocRepository,
                builder: (context, state) {
                  if (state is RepositoryInitialState) {
                    return const LoadingTransparent();
                  } else if (state is RepositorySuccessState) {
                    return Repositories(
                      user: blocRepository.user,
                    );
                  } else if (state is RepositoryErrorState) {
                    return const Text(
                      'Erro ao tentar conseguir repositórios.',
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
