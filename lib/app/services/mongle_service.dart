import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:monglee/app/config/constants.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/entities/todo_entity.dart';

class MongleeService extends GetxService {
  late final Box todoBox;
  late final Box diaryBox;

  Future<MongleeService> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoEntityAdapter());
    Hive.registerAdapter(DiaryEntityAdapter());
    todoBox = await Hive.openBox<TodoEntity>(TODO_BOX);
    diaryBox = await Hive.openBox<DiaryEntity>(DIARY_BOX);
    return this;
  }

  Box get todoLocalDB => todoBox;

  Box get diaryLocalDB => diaryBox;

  void closeHive() async{
    await todoBox.close();
    await diaryBox.close();
  }
}
