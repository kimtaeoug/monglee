import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/extensions/time.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/components/loading/monglee_network_img.dart';
import 'package:monglee/presentation/controllers/diary/diary_controller.dart';

class DiaryPage extends StatelessWidget {
  final DateTime nowDate;

  DiaryPage({Key? key, required this.nowDate}) : super(key: key);

  final TextStyle _style = Styler.style(color: gray400, height: 1.5);
  final DiaryController diaryController = Get.find();
  final CommonUI commonUI = CommonUI();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Rx<DiaryEntity?> data =
          diaryController.diaryMap[Time.refineDate(nowDate)].obs;
      return CustomScrollView(
        slivers: [
          data.value != null
              ? SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (data.value?.diary_img_url != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 27),
                          child: diaryImgFromLocal(data.value!.diary_img_url!),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          width: Get.width,
                          child: Text(
                            data.value?.diary_content ?? '',
                            style: _style,
                            maxLines: null,
                          ),
                        ),
                      )
                    ],
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
        child: commonUI.cottonItem(3, contentsAlter: '아직 작성한 일기가 없어요!', betweenSpace: 16),
      );

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

  Widget diaryImgFromLocal(String url) {
    final Uint8List data = base64Decode(url);
    return Container(
      width: Get.width - 48,
      height: (Get.width - 48) * 184 / 390,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(image: MemoryImage(data), fit: BoxFit.cover)),
    );
  }
}
