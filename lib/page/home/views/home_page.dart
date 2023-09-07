import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monglee/page/home/views/calendar/home_appbar.dart';
import 'package:monglee/page/home/views/monglee_bottom_navigation.dart';
import 'package:monglee/page/home/views/todo_or_diary/todo_or_diary_head.dart';
import 'package:monglee/page/home/views/todo_or_diary/todo/todo_page.dart';
import 'package:monglee/util/moglee_color.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: gray150,
          appBar: HomeAppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ToDoOrDiaryHead(),
              TodoPage()
            ],
          ),
          bottomNavigationBar: MongleeBottomNavi(onTap: (idx) {}),
          floatingActionButton: Padding(
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
        ),
        onWillPop: () {
          return Future(() => false);
        });
  }
}
