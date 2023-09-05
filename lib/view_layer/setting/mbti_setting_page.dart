import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';
import 'package:monglee/view_layer/component/common_ui.dart';

class MbtiSettingPage extends StatefulWidget{
  MbtiSettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_MbtiSettingPage();
}

class _MbtiSettingPage extends State<MbtiSettingPage>{
  @override
  void initState(){
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
                    'MBTI를 선택해주세요', '나의 MBTI 유형에 맞게 일정을 관리 할 수 있어요!')
              ],
            ),

          ],
        ),
      ),
    );
  }
  final TextStyle _selectedStyle = Styler.style(
    fontSize: 32,
    fontWeight: FontWeight.w500
  );
  final TextStyle _unSelectedStyle = Styler.style(

  );
  Widget _mbtiItem(String text){
    return Container(
      width: 74,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: gray200),
        color: Colors.white
      ),
    );
  }
}
