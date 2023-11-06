import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/presentation/controllers/todo/todo_contoller.dart';
import 'package:monglee/presentation/pages/diary/diary_page.dart';
import 'package:monglee/presentation/pages/home/widgets/home_appbar.dart';
import 'package:monglee/presentation/pages/todo/todo_page.dart';
import 'package:monglee/presentation/pages/todo_or_diary/widget/todo_or_diary_head.dart';

class ToDoOrDiaryPage extends StatefulWidget {
  ToDoOrDiaryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ToDoOrDiaryPage();
}

class _ToDoOrDiaryPage extends State<ToDoOrDiaryPage> {
  final PageController pageController = PageController();
  bool _isClick = false;
  final Duration _animationDuration = const Duration(milliseconds: 300);


  // final TodoController todoController = Get.find();
  @override
  void initState(){
    // todoController.getTodoList();
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  final DateTime now = DateTime.now();

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
            dateTime: now,
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
