// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
// import 'package:monglee/page/home/domain/data/monglee_hive.dart';
// import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/data/todo_repository.dart';
// import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/domain/entity/todo_entity.dart';
//
// class TodoController extends GetxController {
//   final Rx<List<TodoModel>> todoList = <TodoModel>[].obs.obs;
//
//   final Logger logger = Logger(printer: PrettyPrinter());
//
//   final MongleeHive hive = MongleeHive.hive;
//
//   void getTodoList() async {
//     for (TodoModel element in hive.todoBox.values) {
//       logger.e('element : $element');
//     }
//   }
//
//   void insertTodo() async {
//     hive.todoBox.add(TodoModel(
//         title: title.value,
//         contents: contents.value,
//         location: location.value,
//         startTime: '${startHour.value},${startMinutes.value}',
//         endTime: '${endHour.value}, ${endMinutes.value}',
//         notiIdx: selectedNotiIdx.value,
//         repeatIdx: selectedRepeatIdx.value,
//         participant: [participant.value]));
//   }
//
//   ///
//   /// Editor
//   ///
//   Rx<String> title = ''.obs;
//   Rx<String> contents = ''.obs;
//   Rx<String> location = ''.obs;
//   Rx<String> participant = ''.obs;
//
//   Rx<int> startHour = (-1).obs;
//   Rx<int> startMinutes = (-1).obs;
//
//   Rx<int> endHour = (-1).obs;
//   Rx<int> endMinutes = (-1).obs;
//
//   Rx<int> selectedRepeatIdx = (-1).obs;
//   Rx<int> selectedNotiIdx = (-1).obs;
//
//   bool editCompleteCondition() => title.value.isNotEmpty;
//
//   void clearData() {
//     title.value = '';
//     contents.value = '';
//     location.value = '';
//     participant.value = '';
//     startHour.value = -1;
//     startMinutes.value = -1;
//     endHour.value = -1;
//     endMinutes.value = -1;
//     selectedRepeatIdx.value = -1;
//     selectedNotiIdx.value = -1;
//   }
// }
