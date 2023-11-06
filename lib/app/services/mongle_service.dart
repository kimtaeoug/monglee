import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MongleeService extends GetxService{
  late final Box todoBox;
  late final Box diaryBox;

  void init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(TodoModelAdapter());
    // Hive.registerAdapter(DiaryModelAdapter());
    // todoBox = await Hive.openBox<TodoModel>(TODO_BOX);
    // diaryBox = await Hive.openBox<DiaryModel>(DIARY_BOX);
  }
}
