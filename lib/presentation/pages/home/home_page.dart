import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/routes/app_routes.dart';
import 'package:monglee/presentation/controllers/diary/diary_controller.dart';
import 'package:monglee/presentation/controllers/todo/todo_contoller.dart';
import 'package:monglee/presentation/controllers/todo_or_diary/todo_or_diary_controller.dart';
import 'package:monglee/presentation/pages/home/widgets/monglee_bottom_navigation.dart';
import 'package:monglee/presentation/pages/search/search_page.dart';
import 'package:monglee/presentation/pages/setting/setting_page.dart';
import 'package:monglee/presentation/pages/todo_or_diary/todo_or_diary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);
  final TODController todController = Get.find();
  final TodoController todoController = Get.find();
  final DiaryController diaryController = Get.find();

  @override
  void initState() {
    todoController.initTodoList(DateTime.now());
    diaryController.initDiaryList(DateTime.now());
    super.initState();
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: gray150,
          body: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (value) {},
              itemBuilder: (context, idx) {
                switch (idx) {
                  case 0:
                    return Obx((){
                      return ToDoOrDiaryPage(
                        nowDiary: todController.nowTodo.value,
                        clickFunction: (value) {
                          todController.nowTodo.value = !todController.nowTodo.value;
                        },
                      );
                    });
                  case 1:
                    return const SearchPage();
                  case 2:
                    return SettingPage();
                  default:
                    return Container();
                }
              }),
          bottomNavigationBar: MongleeBottomNavi(onTap: (idx) {
            if (mounted) {
              if (_currentIdx == 0 && idx == 2) {
                pageController.jumpToPage(idx);
              } else if (_currentIdx == 2 && idx == 0) {
                pageController.jumpToPage(idx);
              } else {
                pageController.animateToPage(idx,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut);
              }
              setState(() {
                _currentIdx = idx;
              });
            }
          }),
          floatingActionButton: _currentIdx == 0 ? _floatingBtn() : null,
        ),
        onWillPop: () {
          return Future(() => false);
        });
  }

  int _currentIdx = 0;

  Widget _floatingBtn() {
    return GestureDetector(
      onTap: () => Get.toNamed(
          !todController.nowTodo.value ? Routes.TODO_WRITE : Routes.DIARY_EDIT_EMOTION),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          width: 56,
          height: 56,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: mintBg),
          child: Center(
            child: SizedBox(
              width: 32,
              height: 32,
              child: SvgPicture.asset('assets/images/plus_icon.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
