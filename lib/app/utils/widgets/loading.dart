import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        Center(
          child: Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 111, 108, 112),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
