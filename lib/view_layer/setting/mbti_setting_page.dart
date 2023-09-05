import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/util/mbti_util.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';
import 'package:monglee/view_layer/component/common_ui.dart';
import 'package:monglee/view_layer/component/monglee_btn.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                    _mbtiItem(MBTIUtil.getMBTIItem(_selectedMBTI)),
                    _mbtiItem(MBTIUtil.getMBTIItem(_selectedMBTI, idx: 1)),
                    _mbtiItem(MBTIUtil.getMBTIItem(_selectedMBTI, idx: 2)),
                    _mbtiItem(MBTIUtil.getMBTIItem(_selectedMBTI, idx: 3))
                  ],
                )
              ],
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
                      btnColor: _selectedMBTI != '' ? primaryColor : gray100,
                      text: '완료',
                      textStyle:
                          _selectedMBTI != '' ? null : _unSelectedBtnStyle,
                      clickFuntion: () {
                        if (_selectedMBTI != '') {}
                      })
                ],
              ),
            )
          ],
        ),
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
          style: _selectedMBTI != '' ? _selectedStyle : _unSelectedStyle,
        ),
      ),
    );
  }

  final TextStyle _pickerItemStyle = Styler.style(
    color: textLightPrimary,
    fontSize: 23,
  );

  String _selectedMBTI = '';

  Widget _mbtiPicker() {
    return SizedBox(
      width: Get.width,
      height: Get.width * 212 / 390,
      child: CupertinoPicker.builder(
          backgroundColor: Colors.white,
          childCount: MBTIUtil.mbtiList.length,
          itemExtent: 27,
          onSelectedItemChanged: (idx) {
            if (mounted) {
              setState(() {
                _selectedMBTI = MBTIUtil.mbtiList[idx];
              });
            }
          },
          itemBuilder: (context, idx) {
            return SizedBox(
              width: Get.width,
              height: 27,
              child: Text(
                MBTIUtil.mbtiList[idx],
                style: _pickerItemStyle,
              ),
            );
          }),
    );
  }
}
