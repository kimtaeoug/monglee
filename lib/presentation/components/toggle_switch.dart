import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/app/config/moglee_color.dart';

class ToggleSwitch extends StatefulWidget {
  final Function(bool) clickFuntion;
  final Color? selectedColor;
  final Color? unSelectedColor;

  ToggleSwitch({
    Key? key,
    required this.clickFuntion,
    this.selectedColor,
    this.unSelectedColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ToggleSwitch();
}

class _ToggleSwitch extends State<ToggleSwitch> {
  bool _clicked = false;

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
        width: 51,
        height: 31,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: primaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: _clicked
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd,
          child: Container(
            width: 29,
            height: 29,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2,
                      spreadRadius: 1)
                ]),
          ),
        ),
      ),
    );
  }
}
