import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class CommonUI {
  ///
  /// Common Title
  ///
  final TextStyle titleStyle =
      Styler.style(fontSize: 32, fontWeight: FontWeight.w700, height: 1.4);
  final TextStyle subStyle = Styler.style(
      color: dustyGray, fontSize: 16, fontWeight: FontWeight.w500, height: 1.4);

  Widget title(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.only(top: AppBar().preferredSize.height + 80),
      child: SizedBox(
        width: Get.width,
        child: Text.rich(
          TextSpan(children: [
            TextSpan(text: '$title\n', style: titleStyle),
            TextSpan(text: subTitle, style: subStyle)
          ]),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  ///
  /// Cotton
  ///
  Widget cottonItem(int cottonIdx, String contents,
      {bool isTextBottom = true, double? space, double? size}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isTextBottom == false)
          _cottonText(contents, isTextBottom: isTextBottom, space: space),
        SizedBox(
          width: size ?? 64,
          height: size ?? 64,
          child: Image.asset('assets/images/cotton_$cottonIdx.png'),
        ),
        if (isTextBottom == true)
          _cottonText(contents, isTextBottom: isTextBottom, space: space),
      ],
    );
  }

  final TextStyle _cottonStyle = Styler.style(
      fontSize: 24, fontWeight: FontWeight.w700, fontType: FontType.uhbeeem);

  Widget _cottonText(
    String contents, {
    bool isTextBottom = true,
    double? space,
  }) {
    return Padding(
      padding: isTextBottom
          ? EdgeInsets.only(bottom: space ?? 16)
          : EdgeInsets.only(top: space ?? 16),
      child: Text(
        contents,
        style: _cottonStyle,
      ),
    );
  }
}
