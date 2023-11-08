import 'package:get/get.dart';
import 'package:monglee/app/config/constants.dart';
import 'package:monglee/app/util/monglee_logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MongleeService extends GetxService {
  late final Database mongleeDB;
  late final String dbPath;

  Future<MongleeService> init() async {
    String path = await getDatabasesPath();
    dbPath = join(path, MONGLEE_DB);
    if (await databaseExists(dbPath)) {
      mongleeDB = await openDatabase(dbPath);
    } else {
      mongleeDB =
          await openDatabase(dbPath, version: 1, onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE $TODO_TABLE (todo_id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, start_time TEXT, end_time TEXT, title TEXT, todo_content TEXT, place TEXT, alarm TEXT, repeat TEXT, companion TEXT,  mbti TEXT)');
      });
    }
    return this;
  }

  void closeDB() async {
    await mongleeDB.close();
  }

  void deleteDB() async {
    await deleteDatabase(dbPath);
  }

  Database get db => mongleeDB;
//// Get a location using getDatabasesPath
// var databasesPath = await getDatabasesPath();
// String path = join(databasesPath, 'demo.db');
//
// // Delete the database
// await deleteDatabase(path);
//
// // open the database
// Database database = await openDatabase(path, version: 1,
//     onCreate: (Database db, int version) async {
//   // When creating the db, create the table
//   await db.execute(
//       'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
// });
}
