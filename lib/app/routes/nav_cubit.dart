import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petize_test/app/features/github_user/presentation/infos_user/infos_user.dart';

class NavCubit extends Cubit<InfosUser> {
  NavCubit(super.initialState);

  void showSecondPage(InfosUser page) => emit(page);

  void popPage(InfosUser page) => emit(page);
}
