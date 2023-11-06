import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/util/monglee_util.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/components/monglee_appbar.dart';
import 'package:monglee/presentation/components/monglee_btn.dart';

class DiaryEditorPage extends StatefulWidget {
  DiaryEditorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DiaryEditorPage();
}

class _DiaryEditorPage extends State<DiaryEditorPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final CommonUI commonUI = CommonUI();
  final TextStyle _hintStyle =
      Styler.style(color: gray300, fontWeight: FontWeight.w500, height: 1.4);
  final TextStyle _contentsStyle =
      Styler.style(fontWeight: FontWeight.w500, height: 1.4);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: gray150,
          appBar: MongleeAppBar.onlyBack(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonUI.cottonItem(
                3,
                '오늘의 감정',
                isTextBottom: false,
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                  child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    minLines: 1,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: controller,
                    onTap: () {},
                    onChanged: (value) {},
                    onEditingComplete: () {},
                    onFieldSubmitted: (value) {},
                    style: _contentsStyle,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        hintStyle: _hintStyle,
                        hintText: 'Jay님 오늘은 어떤 하루였나요?'),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: MongleeBtn(clickFuntion: () {}),
              )
            ],
          ),
        ),
        Positioned(
          right: 24,
          bottom: _galleryPosition(),
          child: SizedBox(
            width: 60,
            height: 60,
            child: SvgPicture.asset('assets/images/gallery_icon.svg'),
          ),
        )
      ],
    );
  }

  double _galleryPosition() {
    if (MongleeUtil.checkKeyBoardIsOpenWidthMediaQuery(context)) {
      return MediaQuery.of(context).viewInsets.bottom + 24;
    } else {
      return 125;
    }
  }
}
