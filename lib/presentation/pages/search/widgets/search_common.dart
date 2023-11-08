import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/data/models/todo_model.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/components/loading/tunegem_profile_img.dart';

class SearchCommon {
  final TextStyle _itemTitleStyle =
      Styler.style(fontSize: 12, fontWeight: FontWeight.w700, height: 1.3);
  final TextStyle _itemContentStyle = Styler.style(
      color: gray400, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3);

  Widget _searchTextItem(String title,
      {String? contents,
      String? startTime,
      String? endTime,
      String? location}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(
            color: primaryColor,
            width: 3,
          )),
        ),
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: _itemTitleStyle,
              maxLines: null,
            ),
            _searchTextSplitItem(text: contents),
            if (startTime != null && endTime != null)
              _searchTextSplitItem(text: '$startTime - $endTime'),
            _searchTextSplitItem(text: location)
          ],
        ),
      ),
    );
  }

  Widget _searchTextSplitItem({String? text}) {
    if (text != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          text,
          style: _itemContentStyle,
          maxLines: null,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  final TextStyle _nickNameStyle =
      Styler.style(color: gray400, fontWeight: FontWeight.w500, fontSize: 16);

  final CommonUI commonUI = CommonUI();

  //32/32
  Widget _searchTop(String url, String nickName, String mbti) {
    return SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MongleeProfileImg(url: url, radius: 32),
              const SizedBox(
                width: 8,
              ),
              Text(
                nickName,
                style: _nickNameStyle,
                maxLines: null,
              )
            ],
          ),
          commonUI.mbtiChip(mbti, primaryColor)
        ],
      ),
    );
  }

  Widget searchItem(
      String imgUrl, String nickName, String mbti, List<TodoModel> todoList,
      {Function()? function}) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function.call();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(0, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _searchTop(imgUrl, nickName, mbti),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    todoList.length,
                    (index) => _searchTextItem(todoList[index].title ?? '',
                        contents: todoList[index].contents,
                        startTime: todoList[index].startTime,
                        endTime: todoList[index].endTime,
                        location: todoList[index].location)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
