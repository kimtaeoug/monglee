import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/page/home/views/calendar/home_appbar.dart';
import 'package:monglee/page/home/views/todo_or_diary/todo/views/todo_page.dart';
import 'package:monglee/page/home/views/todo_or_diary/todo_or_diary_head.dart';
import 'package:monglee/util/moglee_color.dart';

class ToDoOrDiaryPage extends StatelessWidget{
  ToDoOrDiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray150,
      appBar: HomeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ToDoOrDiaryHead(),
          TodoPage()
        ],
      ),
    );
  }

}