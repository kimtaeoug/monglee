import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/routes/app_routes.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/components/monglee_appbar.dart';

class DiaryEmotionPage extends StatelessWidget {
  DiaryEmotionPage({Key? key}) : super(key: key);

  final CommonUI commonUI = CommonUI();
  final TextStyle _titleStyle = Styler.style(
      fontSize: 24, fontWeight: FontWeight.w700, fontType: FontType.uhbeeem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray150,
      appBar: MongleeAppBar.onlyBack(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '오늘은 어떤 하루였나요?',
            style: _titleStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonUI.cottonItem(0, function: _moveToDiaryEditorPage),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child:
                      commonUI.cottonItem(1, function: _moveToDiaryEditorPage),
                ),
                commonUI.cottonItem(2, function: _moveToDiaryEditorPage),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonUI.cottonItem(3, function: _moveToDiaryEditorPage),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: commonUI.cottonItem(4, function: _moveToDiaryEditorPage),
              ),
              commonUI.cottonItem(5, function: _moveToDiaryEditorPage),
            ],
          )
        ],
      ),
    );
  }

  void _moveToDiaryEditorPage(int emotion) {
    Get.toNamed(Routes.DIARY_EDIT_CONTENTS, arguments: {'emotion': emotion});
  }
}
