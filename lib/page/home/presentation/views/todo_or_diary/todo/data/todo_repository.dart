import 'package:get/get.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/data/todo_local_provider.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/domain/entity/todo_model.dart';

class TodoRepository extends GetxService{
  final TodoLocalProvider localProvider = TodoLocalProvider.provider;
  ///
  /// Todo Data 가져오기
  ///
  Future<List<TodoModel>> getAllData({bool local = true})async{
    return localProvider.getLocalData();
  }

  void insertData(TodoModel input)async{
    localProvider.insertLocalData(input);
  }


}