import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/bloc/user_bloc.dart';
import 'package:petize_test/app/features/github_user/presentation/blocs/states/user_state.dart';
import 'package:petize_test/app/features/github_user/presentation/homepage/widgets/logo_widget.dart';
import 'package:petize_test/app/features/github_user/presentation/homepage/widgets/textfield_username.dart';
import 'package:petize_test/app/utils/widgets/loading.dart';

class HomePage extends StatelessWidget {
  UserBloc bloc = UserBloc();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                const SizedBox(height: 32),
                BlocBuilder<UserBloc, UserState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is UserLoadingState) {
                      return const Loading();
                    } else if (state is UserSuccessState) {
                      return Container();
                    } else if (state is UserErrorState) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text(
                              state.message,
                              style: TextStyle(color: Colors.red),
                            )),
                      );
                    }
                    return Container();
                  },
                ),
                TextFieldUsername(
                  controllerInput: bloc.controllerInput,
                  onTap: (String value) async {
                    bloc.usernameSearch = value;
                    await bloc.getUser(value, context, bloc);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
