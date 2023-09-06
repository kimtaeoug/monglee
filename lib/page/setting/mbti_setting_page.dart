import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/component/common_ui.dart';
import 'package:monglee/component/monglee_btn.dart';
import 'package:monglee/util/app_routes.dart';
import 'package:monglee/util/mbti_util.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class MbtiSettingPage extends StatefulWidget {
  MbtiSettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MbtiSettingPage();
}

class _MbtiSettingPage extends State<MbtiSettingPage> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonUI.title(
                    'MBTI를 선택해주세요', '나의 MBTI 유형에 맞게 일정을 관리 할 수 있어요!'),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _mbtiItem(MBTIUtil.getMBTIItem(
                        selectdIdx != -1 ? MBTIUtil.mbtiList[selectdIdx] : '')),
                    _mbtiItem(MBTIUtil.getMBTIItem(
                        selectdIdx != -1 ? MBTIUtil.mbtiList[selectdIdx] : '',
                        idx: 1)),
                    _mbtiItem(MBTIUtil.getMBTIItem(
                        selectdIdx != -1 ? MBTIUtil.mbtiList[selectdIdx] : '',
                        idx: 2)),
                    _mbtiItem(MBTIUtil.getMBTIItem(
                        selectdIdx != -1 ? MBTIUtil.mbtiList[selectdIdx] : '',
                        idx: 3))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 58),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _mbtiPicker(),
                const SizedBox(
                  height: 16,
                ),
                MongleeBtn(
                    btnColor: selectdIdx != -1 ? primaryColor : gray100,
                    text: '완료',
                    textStyle: selectdIdx != -1 ? null : _unSelectedBtnStyle,
                    clickFuntion: () {
                      if (selectdIdx != -1) {
                        Get.toNamed(Routes.HOME);
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  final TextStyle _unSelectedBtnStyle =
      Styler.style(color: gray400, fontSize: 16, fontWeight: FontWeight.w700);

  final TextStyle _selectedStyle =
      Styler.style(fontSize: 32, fontWeight: FontWeight.w500);
  final TextStyle _unSelectedStyle = Styler.style();

  Widget _mbtiItem(String text) {
    return Container(
      width: 74,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: gray200),
          color: Colors.white),
      child: Center(
        child: Text(
          text,
          style: selectdIdx != -1 ? _selectedStyle : _unSelectedStyle,
        ),
      ),
    );
  }

  final TextStyle _pickerItemStyle = Styler.style(
    color: textLightPrimary,
    fontSize: 23,
  );
  final TextStyle _unSelectedItemStyle = Styler.style(
    color: darkGray,
    fontSize: 18,
  );

  int selectdIdx = -1;

  Widget _mbtiPicker() {
    return SizedBox(
      width: Get.width,
      height: Get.width * 212 / 390,
      child: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.width * 212 / 390,
            child: ListWheelScrollView(
                useMagnifier: true,
                magnification: 1.1,
                physics: const FixedExtentScrollPhysics(),
                squeeze: 1,
                itemExtent: 27,
                onSelectedItemChanged: (idx) {
                  if (mounted) {
                    setState(() {
                      selectdIdx = idx;
                    });
                  }
                },
                children: List.generate(
                    MBTIUtil.mbtiList.length,
                    (index) => Center(
                          child: Text(
                            MBTIUtil.mbtiList[index].toUpperCase(),
                            style: selectdIdx == index
                                ? _pickerItemStyle
                                : _unSelectedItemStyle,
                          ),
                        ))),
          ),
          Center(
            child: Container(
              width: Get.width,
              height: 31,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                    top: BorderSide(color: silver),
                    bottom: BorderSide(color: silver)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
