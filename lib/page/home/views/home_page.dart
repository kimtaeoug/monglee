import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:monglee/page/home/views/monglee_bottom_navigation.dart';
import 'package:monglee/page/home/views/todo_or_diary/todo_or_diary_page.dart';
import 'package:monglee/page/setting/views/setting_page.dart';
import 'package:monglee/util/app_routes.dart';
import 'package:monglee/util/moglee_color.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);

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
              setState(() {
                _currentIdx = idx;
              });
              pageController.animateToPage(_currentIdx,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut);
            }
          }),
          floatingActionButton: _currentIdx == 0 ? _floatingBtn() : null,
        ),
        onWillPop: () {
          return Future(() => false);
        });
  }

  final Map<int, Widget> _homeMap = {
    0: ToDoOrDiaryPage(),
    1: Container(),
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
