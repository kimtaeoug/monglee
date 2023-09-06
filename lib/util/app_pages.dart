import 'package:get/get.dart';
import 'package:monglee/page/home/views/home_page.dart';
import 'package:monglee/page/intro/splash_page.dart';
import 'package:monglee/page/membership/login_page.dart';
import 'package:monglee/page/setting/mbti_setting_page.dart';
import 'package:monglee/util/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.MBTI_SETTING, page: () => MbtiSettingPage())
  ];
}
