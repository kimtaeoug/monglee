import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';


class TodoToggleSwitch extends StatefulWidget {
  final Function(bool) clickFuntion;
  final double? width;
  final double? height;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final String leftText;
  final String rightText;
  final double padding;

  const TodoToggleSwitch({
    Key? key,
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
  State<StatefulWidget> createState() => _TodoToggleSwitch();
}

class _TodoToggleSwitch extends State<TodoToggleSwitch> {
  bool _clicked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (mounted) {
          widget.clickFuntion.call(_clicked);
          setState(() {
            _clicked = !_clicked;
          });
        }
      },
      child: Container(
          width: widget.width ?? 120,
          height: widget.height ?? 36,
          decoration: BoxDecoration(
              color: widget.unSelectedColor ?? gray500,
              borderRadius: const BorderRadius.all(Radius.circular(24))),
          child: SizedBox(
            width: widget.width ?? 120,
            height: widget.height ?? 36,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (widget.width ?? 120) / 2,
                      height: widget.height ?? 36,
                      child: Center(
                        child: Text(
                          widget.leftText,
                          style: _unSelectedStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (widget.width ?? 120) / 2,
                      height: widget.height ?? 36,
                      child: Center(
                        child: Text(
                          widget.rightText,
                          style: _unSelectedStyle,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(widget.padding),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: _clicked
                        ? AlignmentDirectional.centerStart
                        : AlignmentDirectional.centerEnd,
                    child: Container(
                      width: (widget.width ?? 120) / 2 - widget.padding,
                      height: (widget.height ?? 36) - widget.padding * 2,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          _clicked ? widget.leftText : widget.rightText,
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
