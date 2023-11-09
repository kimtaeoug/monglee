import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monglee/app/extensions/picker.dart';
import 'package:monglee/app/extensions/time.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/usecases/diary_usecase.dart';

class DiaryController extends GetxController {
  final DiaryUseCase diaryUseCase;

  DiaryController(this.diaryUseCase);

  RxDouble diaryEditorHeight = 0.0.obs;

  final RxMap<DateTime, DiaryEntity> diaryMap = <DateTime, DiaryEntity>{}.obs;
  final Rx<Map<DateTime, int>> emotionMap = <DateTime, int>{}.obs.obs;

  void initDiaryList(DateTime time) async {
    List<DiaryEntity> data =
        await diaryUseCase.read(DiaryEntity(date: time.toIso8601String())) ??
            [];
    if (data.isNotEmpty) {
      for (DiaryEntity element in data) {
        DateTime key = Time.refineDate(DateTime.parse(element.date!));
        diaryMap[key] = element;
        emotionMap.value[key] = element.emotion ?? 1;
      }
    }
    diaryMap.refresh();
    emotionMap.refresh();
  }

  void insertDiary(int emotion, String? diaryContent, XFile? imgFile) async {
    DateTime now = DateTime.now();
    DiaryEntity diaryEntity = DiaryEntity(
        emotion: emotion,
        diary_content: diaryContent,
        diary_img_url: imgFile != null
            ? base64Encode(await ImageUtil.saveToUint8List(imgFile))
            : null,
        date: now.toIso8601String());
    diaryUseCase.insert(diaryEntity);
    DateTime key = Time.refineDate(now);
    diaryMap[key] = diaryEntity;
    emotionMap.value[key] = emotion;
    diaryMap.refresh();
  }
}
