import 'package:get/get.dart';
import 'package:monglee/app/util/monglee_logger.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:monglee/domain/usecases/todo_usecase.dart';

class TodoController extends GetxController {
  final TodoUseCase todoUseCase;

  TodoController(this.todoUseCase);

  final Rx<List<TodoEntity>> todoList = <TodoEntity>[].obs.obs;

  void getTodoList() async {
    todoList.value.clear();
    todoList.value.addAll(await todoUseCase.getDataAll() ?? []);
  }

  void insertTodo() async {
    todoUseCase.addData(TodoEntity(
        title: title.value,
        contents: contents.value != '' ? contents.value : null,
        location: location.value != '' ? location.value : null,
        startTime: startHour.value == -1
            ? null
            : '${startHour.value},${startMinutes.value}',
        endTime:
            endHour.value == -1 ? null : '${endHour.value},${endMinutes.value}',
        notiIdx: selectedNotiIdx.value != -1 ? selectedNotiIdx.value : null,
        repeatIdx: selectedRepeatIdx.value != -1 ? selectedRepeatIdx.value : null,
        participant: [participant.value]));
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
