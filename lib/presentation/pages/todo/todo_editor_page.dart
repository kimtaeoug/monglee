import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:monglee/component/monglee_appbar.dart';
import 'package:monglee/component/monglee_btn.dart';
import 'package:monglee/component/monglee_chip.dart';
import 'package:monglee/component/monglee_expanel.dart';
import 'package:monglee/component/monglee_text_input_field.dart';
import 'package:monglee/component/monglee_time_input.dart';
import 'package:monglee/component/monglee_toast.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/data/todo_noti_time.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/data/todo_repeat.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/presentation/controllers/todo_contoller.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart' as t;

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    todoController.clearData();
    _titleController.dispose();
    _contentsController.dispose();
    _locationController.dispose();
    _participantController.dispose();
    super.dispose();
  }

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
                          logger.e('hey!');
                        },
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.title.value = value;
                          }
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
                        onEditingCompleteFunction: () {},
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.contents.value = value;
                          }
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
                            },
                          ),
                          MongleeTimeInput(
                            isStart: false,
                            selectedTimeFunction: (value) {
                              _selectTime(input: value, isStart: false);
                            },
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
                        onEditingCompleteFunction: () {},
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.location.value = value;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _repeatWidget(),
                      const SizedBox(
                        height: 30,
                      ),
                      _notiWidget(),
                      const SizedBox(
                        height: 30,
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
                        onEditingCompleteFunction: () {},
                        onFieldSubmitted: (value) {
                          if (value != null) {
                            todoController.participant.value = value;
                          }
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
                            MognleeToast.show(
                                context: context, msg: '할 일이 저장되었습니다!');
                          } else {
                            MognleeToast.show(
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
                  selected: index == todoController.selectedRepeatIdx.value,
                  selectFunction: () {
                    if (mounted) {
                      todoController.selectedRepeatIdx.value = index;
                    }
                  },
                )));
  }

  Widget _notiWidget() {
    const List<TodoNotiTime> notiList = TodoNotiTime.values;
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
                      todoController.selectedNotiIdx.value = index;
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
