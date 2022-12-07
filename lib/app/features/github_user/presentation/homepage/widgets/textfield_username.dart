import 'package:flutter/material.dart';

import '../../../../../utils/style.dart';

class TextFieldUsername extends StatelessWidget {
  Function(String) onTap;
  TextFieldUsername({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: colorIconTextFormHomePage,
            ),
      ),
      child: TextFormField(
        onFieldSubmitted: onTap,
        textAlignVertical: TextAlignVertical.center,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintTextDirection: TextDirection.ltr,
          alignLabelWithHint: false,
          labelText: 'Label',
          hintText: 'Search',
          hintStyle: defaultColorTextFormHomePage,
          prefix: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(Icons.search),
          ),
          prefixIconColor: colorIconTextFormHomePage,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorBorderTextFormHomePage,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorBorderTextFormHomePage,
            ),
          ),
        ),
      ),
    );
  }
}
