import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

///
/// ToDoList Item
///
@immutable
class ToDoItem extends StatelessWidget {
  final String title;
  final String? contents;
  final String? time;
  final String? location;
  final bool selected;

  ToDoItem(
      {Key? key,
      required this.title,
      this.contents,
      this.time,
      this.location,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
          _itemType(title, _ToDoType.title),
          contents != null
              ? _itemType(contents ?? '', _ToDoType.contents)
              : const SizedBox.shrink(),
          time != null
              ? _itemType(time ?? '', _ToDoType.time)
              : const SizedBox.shrink(),
          location != null
              ? _itemType(location ?? '', _ToDoType.location)
              : const SizedBox.shrink()
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
