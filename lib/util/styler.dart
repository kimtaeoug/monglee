import 'package:flutter/cupertino.dart';

import 'package:monglee/util/moglee_color.dart';

///
/// Text Style
///
class Styler{
  static TextStyle style({
      double fontSize = 14,
      Color color = mineShatf,
      FontWeight fontWeight = FontWeight.w400,
      TextDecoration? textDecoration,
      double? letterSpacing,
      double? height
  }) => TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      decoration: textDecoration,
      letterSpacing: letterSpacing,
      height: height,
      fontFamily: 'pretendard'
    );
}