import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/page/setting/domain/entity/setting_item_model.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class CommonUI {
  ///
  /// Common Title
  ///
  final TextStyle titleStyle =
      Styler.style(fontSize: 32, fontWeight: FontWeight.w700, height: 1.4);
  final TextStyle subStyle = Styler.style(
      color: dustyGray, fontSize: 16, fontWeight: FontWeight.w500, height: 1.4);

  Widget title(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.only(top: AppBar().preferredSize.height + 80),
      child: SizedBox(
        width: Get.width,
        child: Text.rich(
          TextSpan(children: [
            TextSpan(text: '$title\n', style: titleStyle),
            TextSpan(text: subTitle, style: subStyle)
          ]),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  ///
  /// Setting
  ///
  final TextStyle _settingStyle =
      Styler.style(fontSize: 16, fontWeight: FontWeight.w500);

  Widget settingItem(SettingItemModel input) {
    return GestureDetector(
      onTap: () => input.function.call(),
      child: SizedBox(
        height: 40,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                input.title,
                style: _settingStyle,
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset('assets/images/caret_right_icon.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }

  final TextStyle _settingContainerStyle =
      Styler.style(color: gray300, fontWeight: FontWeight.w600);

  Widget settingContainer(String title, List<SettingItemModel> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              child: Text(
                title,
                style: _settingContainerStyle,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  items.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: settingItem(items[index]),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
