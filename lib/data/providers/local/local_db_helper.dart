import 'package:monglee/app/config/constants.dart';
import 'package:monglee/data/providers/local_request_representable.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBHelper {
  final Database db;
  final LocalMethod method;
  TodoEntity? t;
  DiaryEntity? d;

  LocalDBHelper({required this.db, required this.method, this.t, this.d});

  Future requestTodo() async {
    switch (method) {
      case LocalMethod.insert:
        if(t!=null){
          return await db.insert(TODO_TABLE, _forInsertTodo(t!));
        }
        return null;
      case LocalMethod.read:
        if (t?.date != null) {
          return await db.query(TODO_TABLE,
              where: "date >= ? AND date <= ?",
              whereArgs: _forMonthRead(t!.date!));
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

  Future requestDiary() async {
    switch (method) {
      case LocalMethod.insert:
        if(d != null){
          return await db.insert(DIARY_TABLE, _forInsertDiary(d!));
        }else{
          return null;
        }
      case LocalMethod.read:
        if (d?.date != null) {
          return await db.query(DIARY_TABLE,
              where: "date >= ? AND date <= ?",
              whereArgs: _forMonthRead(d!.date!));
        } else {
          return null;
        }
      case LocalMethod.update:
        break;
      case LocalMethod.delete:
        break;
    }
  }

  Map<String, dynamic> _forInsertTodo(TodoEntity input) {
    Map<String, dynamic> data = input.toJson().map((key, value) {
      if (value == null) {
        return MapEntry(key, '');
      } else {
        return MapEntry(key, value);
      }
    });
    data.remove('todo_id');
    return data;
  }
  Map<String, dynamic> _forInsertDiary(DiaryEntity input) {
    Map<String, dynamic> data = input.toJson().map((key, value) {
      if (value == null) {
        return MapEntry(key, '');
      } else {
        return MapEntry(key, value);
      }
    });
    data.remove('diary_id');
    return data;
  }

  List<String> _forMonthRead(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateTime fTime = DateTime(dateTime.year, dateTime.month, 0);
    DateTime lTime = DateTime(dateTime.year, dateTime.month + 1, 0);
    return [fTime.toIso8601String(), lTime.toIso8601String()];
  }
}
