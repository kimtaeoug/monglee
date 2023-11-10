import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/setting_change_type.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/presentation/components/common_ui.dart';

class ChangeUI extends StatelessWidget {
  final SettingChangeType type;
  final String currentValue;
  final Function() function;

  ChangeUI(
      {Key? key,
      required this.type,
      required this.currentValue,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> titleAndSubTitle =
        SettingTypeUtil.getTitleAndSubTitle(type);
    final String title = titleAndSubTitle.first;
    final String subTitle = titleAndSubTitle[1];
    final List<String> dataList = SettingTypeUtil.getList(type);
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: _titleStyle,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(Icons.close),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 10),
            child: Text(
              subTitle,
              style: _subTitleStyle,
            ),
          ),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(
                dataList.length,
                (index) => _commonUI.mbtiChip(
                    dataList[index].toUpperCase(), mbtiColor(dataList[index]),
                    function: function)),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  final CommonUI _commonUI = CommonUI();
  final TextStyle _titleStyle =
      Styler.style(fontSize: 20, fontWeight: FontWeight.w600);
  final TextStyle _subTitleStyle = Styler.style(color: gray300);
}
