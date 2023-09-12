import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/component/common_ui.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/domain/entity/todo_model.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/presentation/views/to_do_item.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final CommonUI commonUI = CommonUI();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            _dummyTodoList.length,
            (index) => Padding(
                  padding: EdgeInsets.only(
                      top: 16,
                      bottom: index == _dummyTodoList.length - 1 ? 16 : 0),
                  child: ToDoItem(todoModel: _dummyTodoList[index]),
                )),
      ),
    ));
  }

  Widget _empty() => Center(
        child: commonUI.cottonItem(3, '아직 작성한 할일이 없어요!'),
      );

  final List<TodoModel> _dummyTodoList = [
    TodoModel(idx: 0, title: '공복 유산소1'),
    TodoModel(
        idx: 1,
        title: '공복 유산소2',
        contents: '런닝머신 30분 + 싸이클 50분',
        startTime: '07:00',
        endTime: '08:00',
        location: '헬스장'),
    TodoModel(
        idx: 2, title: 'Product Team Meeting', contents: 'A 프로젝트 관련 데이터 논의'),
    TodoModel(
        idx: 3,
        title: 'Product Team Meeting',
        startTime: '07:00',
        endTime: '08:00'),
    TodoModel(
        idx: 1,
        title: '공복 유산소2',
        contents: '런닝머신 30분 + 싸이클 50분',
        startTime: '07:00',
        endTime: '08:00',
        location: '헬스장'),
    TodoModel(
        idx: 1,
        title: '공복 유산소2',
        contents: '런닝머신 30분 + 싸이클 50분',
        startTime: '07:00',
        endTime: '08:00',
        location: '헬스장'),
  ];
}
