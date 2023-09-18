import 'package:get/get.dart';
import 'package:monglee/page/bindings/monglee_bindings.dart';
import 'package:monglee/page/home/presentation/views/home_page.dart';
import 'package:monglee/page/home/presentation/views/search/views/search_page.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/diary/presentation/views/diary_editor_page.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/diary/presentation/views/diary_emotion_page.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/presentation/views/todo_editor_page.dart';
import 'package:monglee/page/intro/presentation/views/splash_page.dart';
import 'package:monglee/page/membership/presentation/views/login_page.dart';
import 'package:monglee/page/setting/presentation/views/mbti_setting_page.dart';

import 'package:monglee/util/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashPage(),
        binding: MongleeBindings(route: Routes.SPLASH)),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPage(),
        binding: MongleeBindings(route: Routes.LOGIN)),
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: MongleeBindings(route: Routes.HOME)),
    GetPage(
        name: Routes.MBTI_SETTING,
        page: () => MbtiSettingPage(),
        binding: MongleeBindings(route: Routes.MBTI_SETTING)),
    GetPage(
        name: Routes.TODO_WRITE,
        page: () => const TodoEditorPage(),
        binding: MongleeBindings(route: Routes.TODO_WRITE)),
    GetPage(
        name: Routes.SEARCH,
        page: () => SearchPage(),
        binding: MongleeBindings(route: Routes.SEARCH)),
    GetPage(
        name: Routes.DIARY_EDIT_EMOTION,
        page: () => DiaryEmotionPage(),
        binding: MongleeBindings(route: Routes.DIARY_EDIT_EMOTION)),
    GetPage(
        name: Routes.DIARY_EDIT_CONTENTS,
        page: () => DiaryEditorPage(),
        binding: MongleeBindings(route: Routes.DIARY_EDIT_CONTENTS))
  ];
}
