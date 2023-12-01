import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart' as t;
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/todo_noti_time.dart';
import 'package:monglee/app/extensions/todo_repeat.dart';
import 'package:monglee/app/util/monglee_keyboard_util.dart';
import 'package:monglee/presentation/components/monglee_appbar.dart';
import 'package:monglee/presentation/components/monglee_btn.dart';
import 'package:monglee/presentation/components/monglee_chip.dart';
import 'package:monglee/presentation/components/monglee_expanel.dart';
import 'package:monglee/presentation/components/monglee_time_input.dart';
import 'package:monglee/presentation/components/monglee_toast.dart';
import 'package:monglee/presentation/controllers/todo/todo_contoller.dart';

import '../../components/monglee_text_input_field.dart';

class TodoEditorPage extends StatefulWidget {
  const TodoEditorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoEditorPage();
}

class _TodoEditorPage extends State<TodoEditorPage> {
  final TodoController todoController = Get.find();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentsController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _participantController = TextEditingController();

  final DateTime? selectedDate = Get.arguments?['selectedDate'];

  @override
  void initState() {
    if (selectedDate != null) {
      todoController.selectedDate.value = selectedDate ?? DateTime(1996);
    }
    super.initState();
  }

  @override
  void dispose() {
    // todoController.clearData();
    _titleController.dispose();
    _contentsController.dispose();
    _locationController.dispose();
    _participantController.dispose();
    super.dispose();
  }

  t.Time _selectedTime = t.Time(hour: 0, minute: 0, second: 0);
  final Logger logger = Logger(printer: PrettyPrinter());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                        controller: _titleController,
                        hint: '제목을 입력해주세요',
                        onChanged: (value) {
                          if (value != null) {
                            todoController.title.value = value;
                          }
                        },
                        //키보드에서 이동눌렀을때
                        onEditingCompleteFunction: () {
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.title.value = value;
                          }
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MongleeTextInputField(
                        controller: _contentsController,
                        hint: '세부 정보를 입력해주세요',
                        onChanged: (value) {
                          if (value != null) {
                            todoController.contents.value = value;
                          }
                        },
                        //키보드에서 이동눌렀을때
                        onEditingCompleteFunction: () {
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.contents.value = value;
                          }
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MongleeTimeInput(
                            selectedTimeFunction: (value) {
                              _selectTime(
                                input: value,
                              );
                              List<TodoNotiTime> dummy =
                                  TodoNotiTimeUtil.notiTimeList(
                                      value.hour, value.minute);
                              setState(() {
                                _selectedTime = value;
                                notiList = dummy;
                              });
                            },
                            initTime: _selectedTime,
                          ),
                          MongleeTimeInput(
                            isStart: false,
                            selectedTimeFunction: (value) {
                              _selectTime(input: value, isStart: false);
                            },
                            initTime: t.Time(
                                hour: _selectedTime.hour,
                                minute: _selectedTime.minute + 1),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MongleeTextInputField(
                        controller: _locationController,
                        hint: '장소를 입력해주세요',
                        onChanged: (value) {
                          if (value != null) {
                            todoController.location.value = value;
                          }
                        },
                        //키보드에서 이동눌렀을때
                        onEditingCompleteFunction: () {
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.location.value = value;
                          }
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // _repeatWidget(),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      if (notiList.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: _notiWidget(),
                        ),
                      MongleeTextInputField(
                        controller: _participantController,
                        hint: '참석자를 입력해주세요 ',
                        onChanged: (value) {
                          if (value != null) {
                            todoController.participant.value = value;
                          }
                        },
                        //키보드에서 이동눌렀을때
                        onEditingCompleteFunction: () {
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.participant.value = value;
                          }
                          MongleeKeyBoardUtil.closeKeyBoard(context: context);
                        },
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
                      child: MongleeBtn(
                        clickFuntion: () {
                          if (todoController.editCompleteCondition()) {
                            todoController.insertTodo();
                            MongleeToast.show(
                                context: context, msg: '할 일이 저장되었습니다!');
                            Get.back();
                          } else {
                            MongleeToast.show(
                                context: context, msg: '입력 내용이 부족합니다!');
                          }
                        },
                        btnColor: todoController.editCompleteCondition()
                            ? primaryColor
                            : gray200,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _repeatWidget() {
    const List<TodoRepeat> repeatList = TodoRepeat.values;
    return MongleeExpanel(
        title: todoController.selectedRepeatIdx.value == -1
            ? '반복 안함'
            : repeatList
                .elementAt(todoController.selectedRepeatIdx.value)
                .contents,
        items: List.generate(
            repeatList.length,
            (index) => MongleeChip(
                  text: repeatList[index].contents,
                  selected: todoController.selectedRepeatIdx.value == index,
                  selectFunction: () {
                    if (mounted) {
                      todoController.selectedRepeatIdx.value = index;
                    }
                  },
                )));
  }

  List<TodoNotiTime> notiList = [];

  Widget _notiWidget() {
    return MongleeExpanel(
        title: todoController.selectedNotiIdx.value == -1
            ? '알림 없음'
            : notiList.elementAt(todoController.selectedNotiIdx.value).contents,
        items: List.generate(
            notiList.length,
            (index) => MongleeChip(
                  text: notiList[index].contents,
                  selected: todoController.selectedNotiIdx.value == index,
                  selectFunction: () {
                    if (mounted) {
                      todoController.selectedNotiIdx.value = notiList
                          .elementAt(todoController.selectedNotiIdx.value)
                          .code;
                    }
                  },
                )));
  }

  void _selectTime({required t.Time input, bool isStart = true}) {
    if (isStart == true) {
      todoController.startHour.value = input.hour;
      todoController.startMinutes.value = input.minute;
    } else {
      todoController.endHour.value = input.hour;
      todoController.endMinutes.value = input.minute;
    }
  }
}
