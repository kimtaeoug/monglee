import 'package:get/get.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/data/todo_repository.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/presentation/controllers/todo_contoller.dart';
import 'package:monglee/util/app_routes.dart';

class MongleeBindings extends Bindings {
  final String route;

  MongleeBindings({required this.route});

  @override
  void dependencies() {
    switch (route) {
      case Routes.HOME:
        Get.put(TodoController(repository: TodoRepository()));
        break;
      case Routes.LOGIN:
        break;
      case Routes.SPLASH:
        break;
      case Routes.MBTI_SETTING:
        break;
      case Routes.TODO_WRITE:
        break;
      case Routes.SEARCH:
        break;
      case Routes.DIARY_EDIT_CONTENTS:
        break;
      case Routes.DIARY_EDIT_EMOTION:
        break;
    }
  }
}
