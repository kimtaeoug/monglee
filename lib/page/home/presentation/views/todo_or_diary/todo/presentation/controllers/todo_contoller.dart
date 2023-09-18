import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/data/todo_repository.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/domain/entity/todo_model.dart';

class TodoController extends GetxController{
  TodoRepository repository;
  TodoController({required this.repository});

  final Rx<List<TodoModel>> todoList = <TodoModel>[].obs.obs;

  final Logger logger = Logger(
    printer: PrettyPrinter()
  );
  void getTodoList()async{
    logger.e('repository : ${repository.getAllData()}');
  }

  void insertTodo()async{

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
  bool editCompleteCondition() => title.value.isNotEmpty;
  void clearData(){
    title.value = '';
    contents.value = '';
    location.value = '';
    participant.value =  '';
    startHour.value = -1;
    startMinutes.value = -1;
    endHour.value = -1;
    endMinutes.value = -1;
  }

}