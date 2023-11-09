import 'package:get/get.dart';
import 'package:monglee/data/repositories/diary_local_repo_impl.dart';
import 'package:monglee/data/repositories/setting_local_repo_impl.dart';
import 'package:monglee/data/repositories/todo_local_repo_impl.dart';

class DependencyCreator{
  static init(){
    Get.put(TodoLocalRepoImpl());
    Get.put(DiaryLocalRepoImpl());
    Get.put(SettingLocalRepoImpl());
  }
}