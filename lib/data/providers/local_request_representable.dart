import 'package:monglee/app/config/constants.dart';
import 'package:monglee/app/util/monglee_logger.dart';
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
        return await db.insert(TODO_TABLE, forInsert(t!));
        // return await db.transaction((txn) async {
        //   'INSERT INTO $TODO_TABLE'
        //       '(date, start_time, end_time, title, todo_content, place, alarm, repeat, companion) '
        //       'VALUES(${t?.date ?? ''}, ${t?.startTime ?? ''}, ${t?.endTime ?? ''}, ${t?.title ?? ''} ${t?.todoContent ?? ''}, ${t?.place ?? ''}, ${t?.alarm ?? ''}, ${t?.repeat ?? ''}, ${t?.companion ?? ''})';
        // });
      case LocalMethod.read:
        if (t?.date != null) {
          return await db.rawQuery(
              'SELECT * FROM $TODO_TABLE WHERE SUBSTR(date, 1, 10) = ?',
              [t?.date?.substring(0, 10)]);
        } else {
          return null;
        }
      case LocalMethod.update:
        return await db.rawUpdate(
            'UPDATE $TODO_TABLE SET date = ${t?.date ?? ''}, start_time = ${t?.start_time ?? ''}, end_time = ${t?.end_time ?? ''}, title = ${t?.title ?? ''}, todo_content = ${t?.todo_content ?? ''}, place = ${t?.place ?? ''},'
            'alarm = ${t?.alarm ?? ''}, repeat = ${t?.repeat ?? ''}, companion = ${t?.companion ?? ''} WHERE todo_id = ${t?.todo_id ?? -1}');
      case LocalMethod.delete:
        return await db.rawDelete(
            'DELETE FROM $TODO_TABLE WHERE todo_id = ${t?.todo_id ?? -1}');
    }
  }
  Map<String, dynamic> forInsert(TodoEntity t){
    Map<String, dynamic> data = t.toJson().map((key, value){
      if(value == null){
        return MapEntry(key, '');
      }else{
        return MapEntry(key, value);
      }
    });
    data.remove('todoId');
    return data;
    // return value.remove('todo_id');
  }
}
