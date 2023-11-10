import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/extensions/setting_change_type.dart';
import 'package:monglee/app/util/monglee_logger.dart';
import 'package:monglee/app/util/version_util.dart';
import 'package:monglee/data/models/setting_item_model.dart';
import 'package:monglee/presentation/components/monglee_toast.dart';
import 'package:monglee/presentation/controllers/setting/setting_controller.dart';
import 'package:monglee/presentation/pages/setting/widgets/change_ui.dart';
import 'package:monglee/presentation/pages/setting/widgets/setting_component.dart';
import 'package:monglee/presentation/pages/setting/widgets/setting_user_info.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final SettingComponent commonUI = SettingComponent();
  final SettingController sController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SettingUserInfo(
                  mbti: sController.mbti.value,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              commonUI.settingContainer('내 정보', myInfoList(context)),
              const SizedBox(
                height: 16,
              ),
              commonUI.settingContainer('테마 정보', themeList(context)),
              const SizedBox(
                height: 16,
              ),
              commonUI.settingContainer('설정', settingList),
              const SizedBox(
                height: 26,
              )
            ],
          );
        }),
      ),
    );
  }

  List<SettingItemModel> myInfoList(BuildContext context) => [
        // SettingItemModel(title: '닉네임 변경', function: () {}),
        SettingItemModel(
            title: 'MBTI 변경', function: () => _change.call(context))
      ];

  List<SettingItemModel> themeList(BuildContext context) => [
        SettingItemModel(
            title: '폰트 변경',
            function: () =>
                _change.call(context, type: SettingChangeType.font)),
        SettingItemModel(
            title: '테마 변경',
            function: () =>
                _change.call(context, type: SettingChangeType.theme))
      ];
  late final List<SettingItemModel> settingList = [
    // SettingItemModel(
    //     title: '내 일정 공개',
    //     function: () {},
    //     otherData: '나의 일정을 다른 사용자들과 공유할 수 있어요.',
    //     type: SettingItemType.toggle),
    SettingItemModel(
        title: '알림',
        function: () {
          sController.alarm.value = !sController.alarm.value;
          sController.insertData();
        },
        otherData: '서비스 관련 알림을 보내드려요.',
        type: SettingItemType.toggle),
    SettingItemModel(
        title: '앱 버전',
        otherData: versionUtil.version,
        type: SettingItemType.version),
    // SettingItemModel(title: '로그아웃', function: () {}),
    // SettingItemModel(title: '회원탈퇴', function: () {})
  ];
  final VersionUtil versionUtil = VersionUtil();

  void _change(BuildContext context,
      {SettingChangeType type = SettingChangeType.mbti}) {
    Get.bottomSheet(ChangeUI(
        type: type,
        currentValue: '',
        function: (value) {
          switch (type) {
            case SettingChangeType.mbti:
              sController.mbti.value = value;
              break;
            case SettingChangeType.font:
              sController.font.value = value;
              break;
            case SettingChangeType.theme:
              sController.theme.value = value;
              break;
          }
          sController.insertData();
          Get.back();
          MognleeToast.show(context: context, msg: '변경 내용이 저장되었습니다!');
        }));
  }
}
