import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/component/common_ui.dart';
import 'package:monglee/component/monglee_appbar.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

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
                commonUI.cottonItem(2, '행복'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: commonUI.cottonItem(3, '기쁨'),
                ),
                commonUI.cottonItem(1, '평온'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonUI.cottonItem(3, '우울'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: commonUI.cottonItem(1, '화남'),
              ),
              commonUI.cottonItem(4, '슬픔'),
            ],
          )
        ],
      ),
    );
  }
}
