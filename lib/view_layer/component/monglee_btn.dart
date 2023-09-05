import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class MongleeBtn extends StatelessWidget {
  final Color btnColor;
  final String? text;
  final Widget? child;
  final TextStyle? textStyle;
  final Function() clickFuntion;
  final double? width;
  final double? height;
  final double? horizontalPadding;

  MongleeBtn(
      {Key? key,
      this.btnColor = primaryColor,
      this.text,
      this.textStyle,
      required this.clickFuntion,
      this.width,
      this.height,
      this.child,
      this.horizontalPadding})
      : super(key: key);
  final TextStyle _defaultStyle = Styler.style(
      fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 24),
      child: GestureDetector(
        onTap: () => clickFuntion.call(),
        child: Container(
          width: width ?? Get.width,
          height: height ?? 56,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: btnColor,
          ),
          child: Center(
            child: child ??
                Text(
                  text ?? '확인',
                  style: textStyle ?? _defaultStyle,
                ),
          ),
        ),
      ),
    );
  }
}
