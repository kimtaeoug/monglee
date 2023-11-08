import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monglee/presentation/components/loading/monglee_network_img.dart';

class DiaryCommon {
  Widget diaryImg(String url) {
    return SizedBox(
      width: Get.width - 48,
      height: (Get.width - 48) * 184 / 390,
      child: MongleeNetWorkImage(
        imgUrl: url,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        imgWidth: Get.width - 48,
        imgHeight: (Get.width - 48) * 184 / 390,
      ),
    );
  }
}
