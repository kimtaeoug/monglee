import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/controllers/todo/todo_contoller.dart';
import 'package:monglee/presentation/pages/todo/to_do_item.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final CommonUI commonUI = CommonUI();
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Rx<List<TodoEntity>> tList = todoController.todoList;
      return CustomScrollView(
        slivers: [
          tList.value.isEmpty
              ? SliverFillRemaining(
                  child: Center(
                    child: _empty(),
                  ),
                )
              : SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        tList.value.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(
                                  top: 16,
                                  bottom:
                                      index == tList.value.length - 1 ? 16 : 0),
                              child: ToDoItem(
                                todoEntity: tList.value[index],
                                isAlone: tList.value.length == 1,
                              ),
                            )),
                  ),
                )
        ],
      );
    });
    return SingleChildScrollView(
      child: Obx(() {
        Rx<List<TodoEntity>> tList = todoController.todoList;
        return tList.value.isEmpty
            ? Center(
                child: _empty(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    tList.value.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                              top: 16,
                              bottom: index == tList.value.length - 1 ? 16 : 0),
                          child: ToDoItem(todoEntity: tList.value[index]),
                        )),
              );
      }),
    );
  }

  Widget _empty() => Center(
        child: commonUI.cottonItem(3, '아직 작성한 할일이 없어요!'),
      );

// final List<TodoModel> _dummyTodoList = [
//   const TodoModel(dateTime: null, title: '공복 유산소1'),
//   TodoModel(
//       dateTime: null,
//       title: '공복 유산소2',
//       contents: '런닝머신 30분 + 싸이클 50분',
//       // startTime: '07:00',
//       // endTime: '08:00',
//       location: '헬스장'),
//   TodoModel(
//       dateTime: null, title: 'Product Team Meeting', contents: 'A 프로젝트 관련 데이터 논의'),
//   TodoModel(
//       dateTime: null,
//       title: 'Product Team Meeting',
//       // startTime: '07:00',
//       // endTime: '08:00'
//   ),
//   TodoModel(
//       dateTime: null,
//       title: '공복 유산소2',
//       contents: '런닝머신 30분 + 싸이클 50분',
//       // startTime: '07:00',
//       // endTime: '08:00',
//       location: '헬스장'),
//   TodoModel(
//       dateTime: null,
//       title: '공복 유산소2',
//       contents: '런닝머신 30분 + 싸이클 50분',
//       // startTime: '07:00',
//       // endTime: '08:00',
//       location: '헬스장'),
// ];
}
