import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monglee/component/loading/tunegem_profile_img.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/monglee_util.dart';
import 'package:monglee/util/styler.dart';

class SearchCommon {
  final BuildContext context;

  SearchCommon({required this.context});

  final TextStyle _itemTitleStyle =
      Styler.style(fontSize: 12, fontWeight: FontWeight.w700);
  final TextStyle _itemContentStyle =
      Styler.style(color: gray400, fontSize: 12, fontWeight: FontWeight.w500);

  Widget _searchTextItem(String title,
      {String? contents,
      String? startTime,
      String? endTime,
      String? location}) {
    return Container(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            title,
            style: _itemTitleStyle,
            maxLines: null,
          )),
          _searchTextSplitItem(text: contents),
          if (startTime != null && endTime != null)
            _searchTextSplitItem(text: '$startTime - $endTime'),
          _searchTextSplitItem(text: location)
        ],
      ),
    );
  }

  Widget _searchTextSplitItem({String? text}) {
    if (text != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Expanded(
          child: Text(
            text ?? '',
            style: _itemContentStyle,
            maxLines: null,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  final TextStyle _nickNameStyle =
      Styler.style(color: gray400, fontWeight: FontWeight.w500, fontSize: 16);

  //32/32
  Widget _searchTop(String url, String nickName) {
    return SizedBox(
      width: Get.width,
      child: Row(
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
          )
        ],
      ),
    );
  }

  Widget searchItem(String imgUrl, String nickName, String title,
      {String? contents,
      String? startTime,
      String? endTime,
      String? location,
      Function()? function}) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function.call();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchTop(imgUrl, nickName),
          const SizedBox(
            height: 16,
          ),
          _searchTextItem(title,
              contents: contents,
              startTime: startTime,
              endTime: endTime,
              location: location)
        ],
      ),
    );
  }
}
