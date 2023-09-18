import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/diary/domain/entity/diary_model.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/domain/entity/todo_model.dart';
import 'package:monglee/util/constants.dart';

class MongleeHive {
  static final MongleeHive hive = MongleeHive._internal();

  factory MongleeHive() => hive;

  MongleeHive._internal();

  late final Box todoBox;
  late final Box diaryBox;

  void init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoModelAdapter());
    Hive.registerAdapter(DiaryModelAdapter());
    todoBox = await Hive.openBox(TODO_BOX);
    diaryBox = await Hive.openBox(DIARY_BOX);
  }
}
