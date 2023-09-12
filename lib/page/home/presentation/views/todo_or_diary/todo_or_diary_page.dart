import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/page/home/presentation/views/calendar/home_appbar.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/diary/presentation/views/diary_page.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/presentation/views/todo_page.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo_or_diary_head.dart';
import 'package:monglee/util/moglee_color.dart';

class ToDoOrDiaryPage extends StatefulWidget {
  ToDoOrDiaryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ToDoOrDiaryPage();
}

class _ToDoOrDiaryPage extends State<ToDoOrDiaryPage> {
  final PageController pageController = PageController();
  bool _isClick = false;
  final Duration _animationDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray150,
      appBar: HomeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ToDoOrDiaryHead(
            clickFunction: (clicked) {
              setState(() {
                _isClick = !_isClick;
              });
              if (_isClick == true) {
                pageController.animateToPage(1,
                    duration: _animationDuration, curve: Curves.linear);
              } else {
                pageController.animateToPage(0,
                    duration: _animationDuration, curve: Curves.linear);
              }
            },
          ),
          Expanded(
              child: PageView.builder(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {},
                  itemBuilder: (context, idx) {
                    return _isClick ? DiaryPage() : TodoPage();
                  }))
        ],
      ),
    );
  }
}
