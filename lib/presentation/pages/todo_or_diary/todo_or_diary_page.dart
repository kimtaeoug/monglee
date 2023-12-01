import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/presentation/controllers/diary/diary_controller.dart';
import 'package:monglee/presentation/controllers/todo/todo_contoller.dart';
import 'package:monglee/presentation/controllers/todo_or_diary/todo_or_diary_controller.dart';
import 'package:monglee/presentation/pages/diary/diary_page.dart';
import 'package:monglee/presentation/pages/home/widgets/monglee_calendar.dart';
import 'package:monglee/presentation/pages/todo/todo_page.dart';
import 'package:monglee/presentation/pages/todo_or_diary/widget/todo_or_diary_head.dart';

class ToDoOrDiaryPage extends StatelessWidget {
  final bool nowDiary;
  final Function(bool) clickFunction;

  ToDoOrDiaryPage(
      {Key? key, required this.nowDiary, required this.clickFunction})
      : super(key: key);

  final PageController pageController = PageController();
  final Duration _animationDuration = const Duration(milliseconds: 300);

  final GlobalKey _key = GlobalKey();
  final TODController tController = Get.find();
  final DiaryController dController = Get.find();
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray150,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Obx(() {
                Rx<DateTime> sDate = tController.sDate;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MongleeCaneldar(
                      date: sDate.value,
                      selectedFunction: (d1, d2) {
                        tController.sDate.value = d1;
                      },
                      pageChangedFunction: (d) {
                        tController.sDate.value = d;
                        todoController.getTodoList(d);
                        dController.getDiaryList(d);
                      },
                      calendarType: tController.calendarFormat.value,
                      calendarTypeFunction: () {
                        tController.calendarFormat.value =
                            !tController.calendarFormat.value;
                      },
                      emotionMap: dController.emotionMap.value,
                    ),
                    ToDoOrDiaryHead(
                      clicked: nowDiary,
                      clickFunction: (clicked) {
                        clickFunction.call(nowDiary);
                        pageController.animateToPage(nowDiary ? 1 : 0,
                            duration: _animationDuration, curve: Curves.linear);
                      },
                      dateTime: sDate.value,
                    ),
                    Expanded(
                      key: _key,
                      child: _pageView(sDate.value),
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
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _pageView(DateTime date) {
    return PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {},
        itemBuilder: (context, idx) {
          return nowDiary
              ? DiaryPage(
                  nowDate: date,
                )
              : TodoPage(
                  nowDate: date,
                );
        });
  }
}
