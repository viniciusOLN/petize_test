import 'package:flutter/material.dart';

import '../../../../../utils/style.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FittedBox(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'Search', style: companyFirstNameStyle),
              TextSpan(text: ' d_devs', style: companySecondNameStyle),
            ],
          ),
        ),
      ),
    );
  }
}
