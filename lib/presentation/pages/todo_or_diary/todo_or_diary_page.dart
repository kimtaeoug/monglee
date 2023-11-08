import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/presentation/controllers/todo_or_diary/todo_or_diary_controller.dart';
import 'package:monglee/presentation/pages/diary/diary_page.dart';
import 'package:monglee/presentation/pages/home/widgets/monglee_calendar.dart';
import 'package:monglee/presentation/pages/todo/todo_page.dart';
import 'package:monglee/presentation/pages/todo_or_diary/widget/todo_or_diary_head.dart';

class ToDoOrDiaryPage extends StatefulWidget {
  const ToDoOrDiaryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ToDoOrDiaryPage();
}

class _ToDoOrDiaryPage extends State<ToDoOrDiaryPage> {
  final PageController pageController = PageController();
  bool _isClick = false;
  final Duration _animationDuration = const Duration(milliseconds: 300);

  final TODController todController = Get.find();

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Rx<DateTime> date = todController.sDate;
      return Scaffold(
        backgroundColor: gray150,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MongleeCaneldar(
                      date: date.value,
                      selectedFunction: (d1, d2) {
                        todController.sDate.value = d1;
                      },
                      pageChangedFunction: (d) {
                        todController.sDate.value = d;
                      },
                      calendarType: todController.calendarFormat.value,
                      calendarTypeFunction: () {
                        todController.calendarFormat.value =
                            !todController.calendarFormat.value;
                      },
                    ),
                    ToDoOrDiaryHead(
                      clickFunction: (clicked) {
                        setState(() {
                          _isClick = !_isClick;
                        });
                        if (_isClick == true) {
                          pageController.animateToPage(1,
                              duration: _animationDuration,
                              curve: Curves.linear);
                        } else {
                          pageController.animateToPage(0,
                              duration: _animationDuration,
                              curve: Curves.linear);
                        }
                      },
                      dateTime: date.value,
                    ),
                    Expanded(
                      key: _key,
                      child: _pageView(date.value),
                    )
                    // todController.widgetSize.value != 0
                    //     ? SizedBox(
                    //         height: todController.widgetSize.value,
                    //         child: _pageView(date.value))
                    //     : Expanded(
                    //         key: _key,
                    //         child: _pageView(date.value),
                    //       )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _pageView(DateTime date) {
    return PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {},
        itemBuilder: (context, idx) {
          return _isClick
              ? const DiaryPage()
              : TodoPage(
                  nowDate: date,
                );
        });
  }
}
