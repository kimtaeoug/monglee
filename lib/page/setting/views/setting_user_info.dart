import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class SettingUserInfo extends StatefulWidget {
  SettingUserInfo({Key? key}) : super(key: key);

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
                Expanded(
                    child: Text(
                  'UserNickName',
                  style: _userNickNameStyle,
                ))
              ],
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: lightCoral,
                ),
                child: Text(
                  'INFJ',
                  style: _mbtiStyle,
                ),
              ),
            )
          ]),
    );
  }

  final TextStyle _userNickNameStyle =
      Styler.style(fontSize: 20, fontWeight: FontWeight.w600);
  final TextStyle _mbtiStyle =
      Styler.style(color: lightCoral, fontWeight: FontWeight.w700);
}
