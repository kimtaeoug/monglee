import 'package:flutter/material.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';

class TodoToggleSwitch extends StatelessWidget {
  final bool clicked;
  final Function(bool) clickFuntion;
  final double? width;
  final double? height;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final String leftText;
  final String rightText;
  final double padding;

  TodoToggleSwitch({
    Key? key,
    required this.clicked,
    required this.clickFuntion,
    this.width,
    this.height,
    this.selectedColor,
    this.unSelectedColor,
    this.leftText = '할일',
    this.rightText = '일기',
    this.padding = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickFuntion.call(clicked);
      },
      child: Container(
          width: width ?? 120,
          height: height ?? 36,
          decoration: BoxDecoration(
              color: unSelectedColor ?? gray500,
              borderRadius: const BorderRadius.all(Radius.circular(24))),
          child: SizedBox(
            width: width ?? 120,
            height: height ?? 36,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (width ?? 120) / 2,
                      height: height ?? 36,
                      child: Center(
                        child: Text(
                          leftText,
                          style: _unSelectedStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (width ?? 120) / 2,
                      height: height ?? 36,
                      child: Center(
                        child: Text(
                          rightText,
                          style: _unSelectedStyle,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: clicked
                        ? AlignmentDirectional.centerStart
                        : AlignmentDirectional.centerEnd,
                    child: Container(
                      width: (width ?? 120) / 2 - padding,
                      height: (height ?? 36) - padding * 2,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          clicked ? leftText : rightText,
                          style: _selectedStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  final TextStyle _selectedStyle =
      Styler.style(color: gray400, fontWeight: FontWeight.w600);
  final TextStyle _unSelectedStyle =
      Styler.style(color: gray400, fontWeight: FontWeight.w500);
}
