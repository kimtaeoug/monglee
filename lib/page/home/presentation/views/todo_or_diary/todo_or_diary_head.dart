import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo_toggle_switch.dart';
import 'package:monglee/util/styler.dart';

class ToDoOrDiaryHead extends StatelessWidget{
  final Function(bool) clickFunction;
  ToDoOrDiaryHead({Key? key,required this.clickFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('8월 30일 수요일', style: _dateStyle,),
          TodoToggleSwitch(clickFuntion: clickFunction)
        ],
      ),
    );
  }
  final TextStyle _dateStyle = Styler.style(
    fontSize: 16,
    fontWeight: FontWeight.w600
  );

}