import 'package:monglee/page/home/domain/data/monglee_hive.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/domain/entity/todo_model.dart';
import 'package:monglee/util/constants.dart';

class TodoLocalProvider{
  static final TodoLocalProvider provider = TodoLocalProvider._internal();
  factory TodoLocalProvider() => provider;
  TodoLocalProvider._internal();

  final MongleeHive hive = MongleeHive.hive;

  ///
  /// Read Data
  ///
  dynamic getLocalData(){
    return hive.todoBox.get(TODO_LIST);
  }
  ///
  /// Insert Data
  ///
  void insertLocalData(TodoModel input)async{
    await hive.todoBox.add(input);
  }
  ///
  /// Update Data
  ///
  void updateLocalData(TodoModel input)async{
    // hive.todoBox.values.first.up
  }
  ///
  /// Delete Data
  ///
  void deleteLocalData(TodoModel input)async{
    hive.todoBox.delete(input.dateTime);
  }
}