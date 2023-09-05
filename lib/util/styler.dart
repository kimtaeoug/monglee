import 'package:flutter/cupertino.dart';

import 'package:monglee/util/moglee_color.dart';

///
/// Text Style
///
class Styler {
  static const String _pretendard = 'pretendard';
  static const String _uhbeem = 'uhbeem';

  static TextStyle style(
          {double fontSize = 14,
          Color color = black,
          FontWeight fontWeight = FontWeight.w400,
          TextDecoration? textDecoration,
          double? letterSpacing,
          double? height,
          FontType? fontType}) =>
      TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          decoration: textDecoration,
          letterSpacing: letterSpacing,
          height: height,
          fontFamily: fontType != null ? getFontType(fontType) : _pretendard);

  static String getFontType(FontType fontType) {
    switch (fontType) {
      case FontType.pretendard:
        return _pretendard;
      case FontType.uhbeeem:
        return _uhbeem;
      default:
        return _pretendard;
    }
  }
}

enum FontType { pretendard, uhbeeem }
