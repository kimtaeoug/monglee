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

  static bool checkKeyBoardIsOpenWidthMediaQuery(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom != 0;
  }

  static bool checkKeyBoardIsOpenWithWidgetsBinding(BuildContext context) {
    return View.of(context).viewInsets.bottom > 0;
  }
  static Size? widgetSize(GlobalKey key){
    if(key.currentContext != null){
     final RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
     return box.size;
    }
    return null;
  }
}
