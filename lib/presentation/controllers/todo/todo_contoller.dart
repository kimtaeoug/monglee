import 'package:get/get.dart';
import 'package:monglee/app/extensions/time.dart';
import 'package:monglee/app/extensions/todo_repeat.dart';
import 'package:monglee/app/util/monglee_util.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:monglee/domain/usecases/todo_usecase.dart';

class TodoController extends GetxController {
  final TodoUseCase todoUseCase;

  TodoController(this.todoUseCase);

  final RxMap<DateTime, List<TodoEntity>> todoMap =
      <DateTime, List<TodoEntity>>{}.obs;

  void initTodoList(DateTime time) async {
    todoMap[Time.refineDate(time)] = (await todoUseCase.read(TodoEntity(
            date:
                DateTime(time.year, time.month, 1, 0, 0).toIso8601String()))) ??
        [];
  }

  void getTodoList(DateTime time) async {
    todoMap[Time.refineDate(time)] =
        (await todoUseCase.read(TodoEntity(date: time.toIso8601String()))) ??
            [];
    // todoList.value.clear();
    // todoList.value.addAll(await todoUseCase
    //         .read(TodoEntity(date: DateTime.now().toIso8601String())) ??
    //     []);
  }

  void insertTodo() async {
    todoUseCase.insert(TodoEntity(
        title: title.value,
        todo_content: contents.value,
        date: DateTime.now().toIso8601String(),
        place: location.value,
        start_time: startHour.value != -1
            ? _convertTime(startHour.value, startMinutes.value)
            : null,
        end_time: endHour.value != -1
            ? _convertTime(endHour.value, endMinutes.value)
            : null,
        companion: participant.value,
        repeat: selectedRepeatIdx.value != -1
            ? TodoRepeatUtil.codeOfTodoRepeat(selectedRepeatIdx.value)
            : null,
        alarm: selectedNotiIdx.value != -1
            ? selectedNotiIdx.value.toString()
            : null));
  }

  String _convertTime(int a, int b) {
    return '${MongleeUtil.tenDigitConverter(a)}:${MongleeUtil.tenDigitConverter(b)}';
  }

  ///
  /// Editor
  ///
  Rx<String> title = ''.obs;
  Rx<String> contents = ''.obs;
  Rx<String> location = ''.obs;
  Rx<String> participant = ''.obs;

  Rx<int> startHour = (-1).obs;
  Rx<int> startMinutes = (-1).obs;

  Rx<int> endHour = (-1).obs;
  Rx<int> endMinutes = (-1).obs;

  Rx<int> selectedRepeatIdx = (-1).obs;
  Rx<int> selectedNotiIdx = (-1).obs;

  bool editCompleteCondition() => title.value.isNotEmpty;

  void clearData() {
    title.value = '';
    contents.value = '';
    location.value = '';
    participant.value = '';
    startHour.value = -1;
    startMinutes.value = -1;
    endHour.value = -1;
    endMinutes.value = -1;
    selectedRepeatIdx.value = -1;
    selectedNotiIdx.value = -1;
  }
}
