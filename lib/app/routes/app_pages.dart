import 'package:get/get.dart';
import 'package:monglee/presentation/pages/diary/diary_editor_page.dart';
import 'package:monglee/presentation/pages/diary/diary_emotion_page.dart';
import 'package:monglee/presentation/pages/home/home_page.dart';
import 'package:monglee/presentation/pages/membership/login_page.dart';
import 'package:monglee/presentation/pages/search/search_page.dart';
import 'package:monglee/presentation/pages/setting/mbti_setting_page.dart';
import 'package:monglee/presentation/pages/splash/splash_page.dart';
import 'package:monglee/presentation/pages/todo/todo_editor_page.dart';

import 'app_routes.dart';
import 'monglee_bindings.dart';
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: MongleeBindings(route: Routes.SPLASH)),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPage(),
        binding: MongleeBindings(route: Routes.LOGIN)),
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: MongleeBindings(route: Routes.HOME)),
    GetPage(
        name: Routes.MBTI_SETTING,
        page: () => const MbtiSettingPage(),
        binding: MongleeBindings(route: Routes.MBTI_SETTING)),
    GetPage(
        name: Routes.TODO_WRITE,
        page: () => const TodoEditorPage(),
        binding: MongleeBindings(route: Routes.TODO_WRITE)),
    GetPage(
        name: Routes.SEARCH,
        page: () => const SearchPage(),
        binding: MongleeBindings(route: Routes.SEARCH)),
    GetPage(
        name: Routes.DIARY_EDIT_EMOTION,
        page: () => DiaryEmotionPage(),
        binding: MongleeBindings(route: Routes.DIARY_EDIT_EMOTION)),
    GetPage(
        name: Routes.DIARY_EDIT_CONTENTS,
        page: () => const DiaryEditorPage(),
        binding: MongleeBindings(route: Routes.DIARY_EDIT_CONTENTS))
  ];
}
