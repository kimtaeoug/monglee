import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/component/monglee_appbar.dart';
import 'package:monglee/component/monglee_btn.dart';
import 'package:monglee/component/monglee_chip.dart';
import 'package:monglee/component/monglee_expanel.dart';
import 'package:monglee/component/monglee_text_input_field.dart';
import 'package:monglee/component/monglee_time_input.dart';

class TodoEditorPage extends StatefulWidget {
  const TodoEditorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoEditorPage();
}

class _TodoEditorPage extends State<TodoEditorPage> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: MongleeAppBar.onlyBack(),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MongleeTextInputField(
                      hint: '제목을 입력해주세요',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MongleeTextInputField(
                      hint: '세부 정보를 입력해주세요',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MongleeTimeInput(),
                        MongleeTimeInput(
                          isStart: false,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MongleeTextInputField(
                      hint: '장소를 입력해주세요',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MongleeExpanel(title: '반복 안함', items: [
                      MongleeChip(text: '반복 안함', selected: true),
                      MongleeChip(text: '매일', selected: false),
                      MongleeChip(text: '매주 월요일', selected: false),
                      MongleeChip(text: '주중 매일(월-금)', selected: false),
                      MongleeChip(text: '매월 첫 번째 월요일', selected: false)
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    MongleeExpanel(title: '10분 전 알림', items: [
                      MongleeChip(text: '10분 전', selected: true),
                      MongleeChip(text: '30분 전', selected: false),
                      MongleeChip(text: '1시간 전', selected: false),
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    MongleeTextInputField(
                      hint: '참석자를 입력해주세요 ',
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Container(
                    width: Get.width,
                    color: Colors.transparent,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 58, top: 40),
                    child: MongleeBtn(clickFuntion: () {}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
