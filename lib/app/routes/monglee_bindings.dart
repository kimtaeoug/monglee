import 'package:get/get.dart';
import 'package:monglee/app/routes/app_routes.dart';
import 'package:monglee/data/repositories/diary_local_repo_impl.dart';
import 'package:monglee/data/repositories/setting_local_repo_impl.dart';
import 'package:monglee/data/repositories/todo_local_repo_impl.dart';
import 'package:monglee/domain/usecases/diary_usecase.dart';
import 'package:monglee/domain/usecases/setting_usecase.dart';
import 'package:monglee/domain/usecases/todo_usecase.dart';
import 'package:monglee/presentation/controllers/diary/diary_controller.dart';
import 'package:monglee/presentation/controllers/setting/setting_controller.dart';
import 'package:monglee/presentation/controllers/todo/todo_contoller.dart';
import 'package:monglee/presentation/controllers/todo_or_diary/todo_or_diary_controller.dart';

class MongleeBindings extends Bindings {
  final String route;

  MongleeBindings({required this.route});

  @override
  void dependencies() {
    switch (route) {
      case Routes.HOME:
        Get.put(TodoUseCase(Get.find<TodoLocalRepoImpl>()));
        Get.put(TodoController(Get.find()));
        Get.put(TODController());
        Get.put(DiaryUseCase(Get.find<DiaryLocalRepoImpl>()));
        Get.put(DiaryController(Get.find()));
        Get.put(SettingUseCase(Get.find<SettingLocalRepoImpl>()));
        Get.put(SettingController(Get.find()));
        break;
      case Routes.LOGIN:
        break;
      case Routes.SPLASH:
        break;
      case Routes.MBTI_SETTING:
        Get.put(SettingUseCase(Get.find<SettingLocalRepoImpl>()));
        Get.put(SettingController(Get.find()));
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
