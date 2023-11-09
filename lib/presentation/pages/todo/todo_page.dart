import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/extensions/time.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/controllers/todo/todo_contoller.dart';
import 'package:monglee/presentation/pages/todo/to_do_item.dart';

class TodoPage extends StatelessWidget {
  final DateTime nowDate;

  TodoPage({Key? key, required this.nowDate}) : super(key: key);

  final CommonUI commonUI = CommonUI();
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomScrollView(
        slivers: [
          todoController.todoMap[Time.refineDate(nowDate)]?.isNotEmpty == true
              ? SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        todoController.todoMap[Time.refineDate(nowDate)]!.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(
                                  top: 16,
                                  bottom:
                                      index == todoController.todoMap[Time.refineDate(nowDate)]!.length - 1 ? 16 : 0),
                              child: ToDoItem(
                                todoEntity: todoController.todoMap[Time.refineDate(nowDate)]![index],
                                isAlone: todoController.todoMap[Time.refineDate(nowDate)]!.length == 1,
                              ),
                            )),
                  ),
                )
              : SliverFillRemaining(
                  child: Center(
                    child: _empty(),
                  ),
                )
        ],
      );
    });
  }

  Widget _empty() => Center(
        child: commonUI.cottonItem(3, contentsAlter: '아직 작성한 할일이 없어요!'),
      );
}
