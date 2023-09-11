import 'package:get/get.dart';
import 'package:monglee/page/home/views/home_page.dart';
import 'package:monglee/page/home/views/search/views/search_page.dart';
import 'package:monglee/page/home/views/todo_or_diary/diary/views/diary_editor_page.dart';
import 'package:monglee/page/home/views/todo_or_diary/diary/views/diary_emotion_page.dart';
import 'package:monglee/page/home/views/todo_or_diary/todo/views/todo_editor_page.dart';
import 'package:monglee/page/intro/splash_page.dart';
import 'package:monglee/page/membership/login_page.dart';
import 'package:monglee/page/setting/views/mbti_setting_page.dart';
import 'package:monglee/util/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.MBTI_SETTING, page: () => MbtiSettingPage()),
    GetPage(name: Routes.TODO_WRITE, page: () => const TodoEditorPage()),
    GetPage(name: Routes.SEARCH, page: () => SearchPage()),
    GetPage(name: Routes.DIARY_EDIT_EMOTION, page: () => DiaryEmotionPage()),
    GetPage(name: Routes.DIARY_EDIT_CONTENTS, page: () => DiaryEditorPage())
  ];
}
