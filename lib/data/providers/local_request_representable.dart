import 'package:monglee/app/config/constants.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:sqflite/sqflite.dart';

enum LocalMethod { insert, read, update, delete }

enum LocalTable { todo, diary }

abstract class LocalRequestRepresentable {
  LocalTable get localTable;

  LocalMethod get localMethod;

  TodoEntity? get todoEntity;

  DiaryEntity? get diaryEntity;

  Future request();
}

class LocalTODOHelper {
  final Database db;
  final LocalMethod method;
  TodoEntity? t;
  LocalTODOHelper({required this.db, required this.method, this.t});

  Future process() async {
    switch (method) {
      case LocalMethod.insert:
        return await db.transaction((txn) async {
          'INSERT INTO $TODO_TABLE'
              '(date, start_time, end_time, title, todo_content, place, alarm, repeat, companion) '
              'VALUES(${t?.date ?? ''}, ${t?.startTime ?? ''}, ${t?.endTime ?? ''}, ${t?.title ?? ''} ${t?.todoContent ?? ''}, ${t?.place ?? ''}, ${t?.alarm ?? ''}, ${t?.repeat ?? ''}, ${t?.companion ?? ''})';
        });
      case LocalMethod.read:
        return await db
            .rawQuery('SELECT * FROM $TODO_TABLE WHERE ${t?.date ?? ''}');
      case LocalMethod.update:
        return await db.rawUpdate(
            'UPDATE $TODO_TABLE SET date = ${t?.date ?? ''}, start_time = ${t?.startTime ?? ''}, end_time = ${t?.endTime ?? ''}, title = ${t?.title ?? ''}, todo_content = ${t?.todoContent ?? ''}, place = ${t?.place ?? ''},'
            'alarm = ${t?.alarm ?? ''}, repeat = ${t?.repeat ?? ''}, companion = ${t?.companion ?? ''} WHERE todo_id = ${t?.todoId ?? -1}');
      case LocalMethod.delete:
        return await db.rawDelete(
            'DELETE FROM $TODO_TABLE WHERE todo_id = ${t?.todoId ?? -1}');
    }
  }
}
