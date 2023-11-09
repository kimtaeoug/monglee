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
      case LocalMethod.read:
        if (t?.date != null) {
          logger.e('date : ${t?.date}');
          return await db
              .query(TODO_TABLE, where: "date >= ? AND date <= ?", whereArgs: _forMonthRead(t!.date!));
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

  Map<String, dynamic> forInsert(TodoEntity t) {
    Map<String, dynamic> data = t.toJson().map((key, value) {
      if (value == null) {
        return MapEntry(key, '');
      } else {
        return MapEntry(key, value);
      }
    });
    data.remove('todoId');
    return data;
  }

  List<String> _forMonthRead(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateTime fTime = DateTime(dateTime.year, dateTime.month, 0);
    DateTime lTime = DateTime(dateTime.year, dateTime.month + 1, 0);
    return [fTime.toIso8601String(), lTime.toIso8601String()];
  }
//DateTime dateTime = DateTime.parse(iso8601DateString);
}
