import 'package:flutter/material.dart';

import 'icon_and_text.dart';

class AlternativeButtons extends StatelessWidget {
  String text;
  String imageUrl;
  AlternativeButtons({Key? key, required this.text, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text.isEmpty
        ? Container()
        : IconText(
            imageUrl: imageUrl,
            textIcon: text,
          );
  }
}
