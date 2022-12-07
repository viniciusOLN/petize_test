import 'package:flutter/material.dart';

const defaultStyleFont = TextStyle(
  fontFamily: 'Nunito',
);

const colorIconTextFormHomePage = Color.fromRGBO(73, 69, 79, 1);
const colorBorderTextFormHomePage = Color.fromRGBO(121, 116, 126, 1);
const defaultColorTextFormHomePage = TextStyle(
  color: Color.fromRGBO(28, 27, 31, 1),
);
const colorUserName = Color.fromRGBO(23, 25, 35, 1);
const colorInfos = Color.fromRGBO(74, 85, 104, 1);
const colorSecondName = Color.fromRGBO(0, 105, 202, 1);

final companyFirstNameStyle = defaultStyleFont.copyWith(
  color: colorSecondName,
  fontSize: 50,
  fontWeight: FontWeight.w500,
);

final companySecondNameStyle = companyFirstNameStyle.copyWith(
  color: const Color.fromRGBO(140, 25, 210, 1),
);

const defaultStyleFontInfos = TextStyle(
  fontFamily: 'Inter',
);

final nameStyleUser = defaultStyleFontInfos.copyWith(
  fontWeight: FontWeight.w700,
  color: colorUserName,
  fontSize: 18,
);

final defaultStyleInfos = defaultStyleFontInfos.copyWith(
  fontSize: 16,
  color: colorInfos,
  fontWeight: FontWeight.w400,
);

final bioUserStyle = defaultStyleFontInfos.copyWith(
  fontSize: 17,
);
