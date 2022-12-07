import 'package:flutter/material.dart';
import 'package:petize_test/app/features/github_user/presentation/homepage/homepage.dart';
import 'app/routes/routes.dart';

void main() {
  runApp(const GitSearch());
}

class GitSearch extends StatelessWidget with Routes {
  const GitSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      //initialRoute: '/',
      //routes: routes(),
    );
  }
}
