import 'package:flutter/material.dart';

import '../../../../../utils/style.dart';

class IconText extends StatelessWidget {
  String imageUrl;
  String textIcon;
  IconText({
    Key? key,
    required this.imageUrl,
    required this.textIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageUrl),
        SizedBox(width: 5),
        Text(
          textIcon,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: defaultStyleInfos,
        ),
      ],
    );
  }
}
