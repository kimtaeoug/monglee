import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:monglee/component/toggle_switch.dart';
import 'package:monglee/page/setting/domain/entity/setting_item_model.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class SettingComponent {
  ///
  /// Setting
  ///
  final TextStyle _settingTitleStyle =
      Styler.style(fontSize: 16, fontWeight: FontWeight.w500);
  final TextStyle _versionStyle =
      Styler.style(color: gray400, fontSize: 16, fontWeight: FontWeight.w500);

  Widget settingItem(SettingItemModel input, {bool isVersion = false}) {
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
                style: _settingTitleStyle,
              ),
              isVersion == true
                  ? Text(
                      input.otherData ?? '',
                      style: _versionStyle,
                    )
                  : SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                          'assets/images/caret_right_icon.svg'),
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
                        child: _whichSettingItem(items[index]),
                      )),
            )
          ],
        ),
      ),
    );
  }

  Widget _whichSettingItem(SettingItemModel input) {
    switch (input.type) {
      case SettingItemType.basic:
        return settingItem(input);
      case SettingItemType.toggle:
        return settingItemWithToggle(input);
      case SettingItemType.version:
        return settingItem(input, isVersion: true);
    }
  }

  final TextStyle _subTitleStyle =
      Styler.style(color: gray300, fontWeight: FontWeight.w500);

  Widget settingItemWithToggle(SettingItemModel input) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width,
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  input.title,
                  style: _settingTitleStyle,
                ),
                ToggleSwitch(clickFuntion: (value) => input.function.call())
              ],
            ),
          ),
          const SizedBox(height: 4,),
          Text(
            input.otherData ?? '',
            style: _subTitleStyle,
          )
        ],
      ),
    );
  }
}
