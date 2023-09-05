import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class CommonUI {
  final TextStyle titleStyle =
      Styler.style(fontSize: 32, fontWeight: FontWeight.w700, height: 1.4);
  final TextStyle subStyle = Styler.style(
      color: dustyGray, fontSize: 16, fontWeight: FontWeight.w500, height: 1.4);

  Widget title(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.only(top: AppBar().preferredSize.height + 80),
      child: Text.rich(TextSpan(children: [
        TextSpan(text: '$title\n', style: titleStyle),
        TextSpan(text: subTitle, style: subStyle)
      ])),
    );
  }
}
