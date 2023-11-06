import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MongleeHive {
  static final MongleeHive hive = MongleeHive._internal();

  factory MongleeHive() => hive;

  MongleeHive._internal();

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
