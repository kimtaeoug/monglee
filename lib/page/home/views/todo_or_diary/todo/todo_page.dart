import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/component/common_ui.dart';
import 'package:monglee/util/moglee_color.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final CommonUI commonUI = CommonUI();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: gray150,
        child: Center(
          child: commonUI.cottonItem(3, '아직 작성한 일기가 없어요'),
        ),
      ),
    );
  }
}
