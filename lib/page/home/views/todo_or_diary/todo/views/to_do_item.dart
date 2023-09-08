import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/page/home/views/todo_or_diary/todo/domain/entity/todo_model.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

///
/// ToDoList Item
///
@immutable
class ToDoItem extends StatelessWidget {
  final TodoModel todoModel;

  ToDoItem({Key? key, required this.todoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        border: Border.all(color: mintBg),
                        shape: BoxShape.circle,
                        color: todoModel.selected ? mintBg : gray150),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        'assets/images/check_icon.svg',
                        color: todoModel.selected ? Colors.white : gray150,
                      ),
                    ),
                  ),
                  if (todoModel.startTime != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        todoModel.startTime ?? '',
                        style: _contentsStyle,
                      ),
                    )
                ],
              ),
            ),
          ),
          Expanded(
              child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: todoModel.selected ? primaryColor : Colors.white,
              border: Border.all(color: primaryColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemType(todoModel.title, _ToDoType.title),
                todoModel.contents != null
                    ? _itemType(todoModel.contents ?? '', _ToDoType.contents)
                    : const SizedBox.shrink(),
                todoModel.startTime != null && todoModel.endTime != null
                    ? _itemType('${todoModel.startTime} - ${todoModel.endTime}',
                        _ToDoType.time)
                    : const SizedBox.shrink(),
                todoModel.location != null
                    ? _itemType(todoModel.location ?? '', _ToDoType.location)
                    : const SizedBox.shrink()
              ],
            ),
          ))
        ],
      ),
    );
  }

  final TextStyle _titleStyle =
      Styler.style(fontSize: 16, fontWeight: FontWeight.w700);
  final TextStyle _contentsStyle =
      Styler.style(fontWeight: FontWeight.w500, color: gray400);

  Widget _itemType(String text, _ToDoType type) {
    switch (type) {
      case _ToDoType.title:
        return SizedBox(
          width: Get.width,
          child: Text(
            text,
            style: _titleStyle,
          ),
        );
      case _ToDoType.contents:
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            width: Get.width,
            child: Text(
              text,
              style: _contentsStyle,
            ),
          ),
        );
      case _ToDoType.time:
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset('assets/images/time_icon.svg'),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  text,
                  style: _contentsStyle,
                )
              ],
            ),
          ),
        );
      case _ToDoType.location:
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset('assets/images/location_icon.svg'),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  text,
                  style: _contentsStyle,
                )
              ],
            ),
          ),
        );
    }
  }
}

enum _ToDoType { title, contents, time, location }
