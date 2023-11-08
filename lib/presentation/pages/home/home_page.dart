import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/routes/app_routes.dart';
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
  final TodoController todoController = Get.find();
  final TODController todController = Get.find();
  @override
  void initState() {
    todoController.initTodoList(todController.sDate.value);
    super.initState();
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
                return _homeMap[idx] ?? Container();
              }),
          bottomNavigationBar: MongleeBottomNavi(onTap: (idx) {
            if (mounted) {
              if(_currentIdx == 0 && idx == 2){
                pageController.jumpToPage(idx);
              }else if(_currentIdx == 2 && idx == 0){
                pageController.jumpToPage(idx);
              }else{
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

  final Map<int, Widget> _homeMap = {
    0: const ToDoOrDiaryPage(),
    1: const SearchPage(),
    2: SettingPage()
  };
  final Logger logger = Logger(printer: PrettyPrinter());
  int _currentIdx = 0;

  Widget _floatingBtn() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.TODO_WRITE),
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
