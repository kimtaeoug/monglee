import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/presentation/components/common_ui.dart';

class SettingUserInfo extends StatefulWidget {
  const SettingUserInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingUserInfo();
}

class _SettingUserInfo extends State<SettingUserInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final CommonUI commonUI = CommonUI();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 64,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: Stack(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: gallery),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                  'assets/images/edit_icon.svg'),
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'UserNickName',
                  style: _userNickNameStyle,
                )
              ],
            ),
            commonUI.mbtiChip(
              'INFJ',
              lightCoral,
            )
          ]),
    );
  }

  final TextStyle _userNickNameStyle =
      Styler.style(fontSize: 20, fontWeight: FontWeight.w600);
}
