import 'package:petize_test/app/features/github_user/presentation/homepage/homepage.dart';
import 'package:petize_test/app/features/github_user/presentation/infos_user/infos_user.dart';

mixin Routes {
  dynamic routes() {
    return {
      "/home": (context) => HomePage(),
      '/profile': '',
    };
  }
}
