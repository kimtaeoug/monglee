import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/page/setting/domain/entity/setting_item_model.dart';
import 'package:monglee/page/setting/views/setting_component.dart';
import 'package:monglee/page/setting/views/setting_user_info.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final SettingComponent commonUI = SettingComponent();

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
            Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: SettingUserInfo(),),
            const SizedBox(
              height: 24,
            ),
            commonUI.settingContainer('내 정보', myInfoList),
            const SizedBox(
              height: 16,
            ),
            commonUI.settingContainer('테마 정보', themeList),
            const SizedBox(
              height: 16,
            ),
            commonUI.settingContainer('설정', settingList),
            const SizedBox(height: 26,)
          ],
        ),
      ),
    );
  }

  final List<SettingItemModel> myInfoList = [
    SettingItemModel(title: '닉네임 변경', function: () {}),
    SettingItemModel(title: 'MBTI 변경', function: () {})
  ];

  final List<SettingItemModel> themeList = [
    SettingItemModel(title: '폰트 변경', function: () {}),
    SettingItemModel(title: '테마 변경', function: () {})
  ];
  final List<SettingItemModel> settingList = [
    SettingItemModel(
        title: '내 일정 공개',
        function: () {},
        otherData: '나의 일정을 다른 사용자들과 공유할 수 있어요.',
        type: SettingItemType.toggle),
    SettingItemModel(
        title: '알림',
        function: () {},
        otherData: '서비스 관련 알림을 보내드려요.',
        type: SettingItemType.toggle),
    SettingItemModel(
        title: '앱 버전',
        function: () {},
        otherData: '1.0.0',
        type: SettingItemType.version),
    SettingItemModel(title: '로그아웃', function: () {}),
    SettingItemModel(title: '회원탈퇴', function: () {})
  ];
}
