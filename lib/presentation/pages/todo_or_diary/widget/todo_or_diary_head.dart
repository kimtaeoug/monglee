import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/extensions/time.dart';
import 'package:monglee/presentation/pages/todo_or_diary/widget/todo_toggle_switch.dart';

class ToDoOrDiaryHead extends StatelessWidget {
  final Function(bool) clickFunction;
  final DateTime dateTime;

  ToDoOrDiaryHead(
      {Key? key, required this.clickFunction, required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Time.convertToEFormat(dateTime),
            style: _dateStyle,
          ),
          TodoToggleSwitch(clickFuntion: clickFunction)
        ],
      ),
    );
  }

  final TextStyle _dateStyle =
      Styler.style(fontSize: 16, fontWeight: FontWeight.w600);
}
