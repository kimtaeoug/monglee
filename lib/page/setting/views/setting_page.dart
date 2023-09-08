import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/component/common_ui.dart';
import 'package:monglee/page/setting/domain/entity/setting_item_model.dart';
import 'package:monglee/page/setting/views/setting_user_info.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class SettingPage extends StatelessWidget{
  SettingPage({Key? key}) : super(key: key);

  final CommonUI commonUI  = CommonUI();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: AppBar().preferredSize.height + 40,
            ),
            SettingUserInfo(),
            const SizedBox(height: 24,),
            commonUI.settingContainer('내 정보', items)

          ],
        ),
      ),
    );
  }
  List<SettingItemModel> myInfoList = [
    SettingItemModel(title: '닉네임 변경', function: (){}),
    SettingItemModel(title: 'MBTI 변경', function: (){})
  ];

  List<SettingItemModel> themeList = [
    SettingItemModel(title: '폰트 변경', function: (){}),
    SettingItemModel(title: '테마 변경', function: (){})
  ];
}