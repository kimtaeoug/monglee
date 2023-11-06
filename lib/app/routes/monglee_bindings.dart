import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:monglee/app/routes/app_routes.dart';

class MongleeBindings extends Bindings {
  final String route;

  MongleeBindings({required this.route});

  @override
  void dependencies() {
    switch (route) {
      case Routes.HOME:
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