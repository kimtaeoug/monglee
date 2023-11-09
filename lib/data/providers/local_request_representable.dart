import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/entities/todo_entity.dart';

enum LocalMethod { insert, read, update, delete }

enum LocalTable { todo, diary }

abstract class LocalRequestRepresentable {
  LocalTable get localTable;

  LocalMethod get localMethod;

  TodoEntity? get todoEntity;

  DiaryEntity? get diaryEntity;

  Future request();
}
