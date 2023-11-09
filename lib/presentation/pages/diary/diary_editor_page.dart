import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/picker.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/util/monglee_util.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/components/monglee_appbar.dart';
import 'package:monglee/presentation/components/monglee_btn.dart';
import 'package:monglee/presentation/components/monglee_toast.dart';
import 'package:monglee/presentation/controllers/diary/diary_controller.dart';

class DiaryEditorPage extends StatefulWidget {
  final int? emotion = Get.arguments['emotion'] as int;

  DiaryEditorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DiaryEditorPage();
}

class _DiaryEditorPage extends State<DiaryEditorPage> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey _key = GlobalKey();
  final DiaryController diaryController = Get.find();

  XFile? selectedImgFile;
  bool contentsFilled = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_listenTextController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (diaryController.diaryEditorHeight.value == 0) {
        diaryController.diaryEditorHeight.value =
            MongleeUtil.widgetSize(_key)?.height ?? 0;
      }
    });
  }

  void _listenTextController() {
    setState(() {
      if (controller.text.isNotEmpty) {
        contentsFilled = true;
      } else {
        contentsFilled = false;
      }
    });
  }

  @override
  void dispose() {
    controller.removeListener(_listenTextController);
    controller.dispose();
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
                widget.emotion ?? 1,
                contentsAlter: '오늘의 감정',
                isTextBottom: false,
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(() {
                RxDouble height = diaryController.diaryEditorHeight;
                if (height.value != 0) {
                  return SizedBox(
                    height: height.value,
                    child: _textWidget(),
                  );
                } else {
                  return Expanded(key: _key, child: _textWidget());
                }
              }),
              Padding(
                padding: const EdgeInsets.only(bottom: 45, top: 70),
                child: MongleeBtn(
                  clickFuntion: () {
                    if (contentsFilled) {
                      diaryController.insertDiary(widget.emotion ?? 1,
                          controller.text, selectedImgFile);
                      MognleeToast.show(context: context, msg: '일기가 저장되었습니다!');
                      Get.close(2);
                    } else {
                      MognleeToast.show(context: context, msg: '입력 내용이 부족합니다!');
                    }
                  },
                  btnColor: contentsFilled ? primaryColor : gray200,
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 24,
          bottom: _galleryPosition(),
          child: GestureDetector(
            onTap: () {
              ImageUtil.pick().then((value) {
                setState(() {
                  selectedImgFile = value;
                });
              });
            },
            child: SizedBox(
              width: 60,
              height: 60,
              child: SvgPicture.asset('assets/images/gallery_icon.svg'),
            ),
          ),
        )
      ],
    );
  }

  Widget _textWidget() {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (selectedImgFile != null)
                AspectRatio(
                  aspectRatio: 343 / 183,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(selectedImgFile!.path)),
                            fit: BoxFit.cover),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                  ),
                ),
              TextFormField(
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
              )
            ],
          ),
        ),
      ),
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
