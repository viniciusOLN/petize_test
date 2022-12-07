import 'package:flutter/material.dart';

class LoadingTransparent extends StatelessWidget {
  const LoadingTransparent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        Container(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
