import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/emotion.dart';
import 'package:monglee/app/extensions/styler.dart';

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
  Widget cottonItem(
    int cottonIdx, {
    String? contentsAlter,
    bool isTextBottom = true,
    double? space,
    double? size,
    double? betweenSpace,
    Function(int)? function,
  }) {
    final String contents = EmotionUtil.getData(cottonIdx);
    final int assetNumber =
        int.parse(EmotionUtil.getData(cottonIdx, state: false));
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function.call(cottonIdx);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isTextBottom == false)
            _cottonText(contentsAlter ?? contents,
                isTextBottom: isTextBottom, space: space),
          SizedBox(
            width: size ?? 64,
            height: size ?? 64,
            child: Image.asset('assets/images/cotton_$assetNumber.png'),
          ),
          if(betweenSpace != null)
            SizedBox(
              height: betweenSpace,
            ),
          if (isTextBottom == true)
            _cottonText(contentsAlter ?? contents,
                isTextBottom: isTextBottom, space: space),
        ],
      ),
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

  ///
  /// MBTI Chip
  ///
  Widget mbtiChip(String text, Color color, {Function()? function}) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: color.withOpacity(0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
        child: Text(
          text,
          style: Styler.style(fontWeight: FontWeight.w700, color: color),
        ),
      ),
    );
  }
}
