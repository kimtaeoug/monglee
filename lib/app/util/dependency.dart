import 'package:get/get.dart';
import 'package:monglee/data/repositories/todo_local_repo_impl.dart';

class DependencyCreator{
  static init(){
    Get.put(TodoLocalRepoImpl());
  }
}