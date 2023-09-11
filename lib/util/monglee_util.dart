import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

class MongleeUtil {
  static Size textSize(
      {required String text,
      required TextStyle textStyle,
      required BuildContext context,
      double? boxWidth,
      double? textScale}) {
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: ui.TextDirection.ltr,
        textScaleFactor: textScale ?? textScaleFactor)
      ..layout(minWidth: 0, maxWidth: boxWidth ?? double.infinity);
    return textPainter.size;
  }

  static String tenDigitConverter(dynamic input) {
    return input >= 10 ? '$input' : '0$input';
  }
}
