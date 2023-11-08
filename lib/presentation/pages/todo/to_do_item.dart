import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/domain/entities/todo_entity.dart';

///
/// ToDoList Item
///
@immutable
class ToDoItem extends StatelessWidget {
  final TodoEntity todoEntity;
  final bool selected;
  final bool isAlone;

  ToDoItem(
      {Key? key,
      required this.todoEntity,
      this.selected = false,
      this.isAlone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16, top: isAlone ? 10 : 0),
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
                        color: gray150
                        // color: todoEntity.selected ? mintBg : gray150
                        ),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        'assets/images/check_icon.svg',
                        colorFilter: ColorFilter.mode(
                            selected ? Colors.white : gray150, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  if (todoEntity.start_time != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        (todoEntity.start_time ?? DateTime.now()).toString(),
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
              color: selected ? primaryColor : Colors.white,
              border: Border.all(color: primaryColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemType(todoEntity.title ?? '', _ToDoType.title),
                todoEntity.todo_content != null
                    ? _itemType(
                        todoEntity.todo_content ?? '', _ToDoType.contents)
                    : const SizedBox.shrink(),
                todoEntity.start_time != null && todoEntity.end_time != null
                    ? _itemType(
                        '${todoEntity.start_time} - ${todoEntity.end_time}',
                        _ToDoType.time)
                    : const SizedBox.shrink(),
                todoEntity.place != null
                    ? _itemType(todoEntity.place ?? '', _ToDoType.location)
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
