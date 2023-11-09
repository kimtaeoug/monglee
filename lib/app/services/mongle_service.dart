import 'package:get/get.dart';
import 'package:monglee/app/config/constants.dart';
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
        await db.execute('CREATE TABLE $TODO_TABLE '
            '(todo_id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'date TEXT, '
            'start_time TEXT, '
            'end_time TEXT, '
            'title TEXT, '
            'todo_content TEXT, '
            'place TEXT, '
            'alarm TEXT, '
            'repeat TEXT, '
            'companion TEXT,  '
            'mbti TEXT)');
        await db.execute('CREATE TABLE $DIARY_TABLE '
            '(diary_id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'emotion INTEGER, '
            'diary_content TEXT, '
            'diary_img_url TEXT, '
            'date TEXT)');
        await db.execute('CREATE TABLE $SETTING_TABLE '
            '(profile_img_url TEXT, '
            'alarm TEXT, '
            'nickname TEXT, '
            'mbti TEXT, '
            'is_public TEXT)');
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
}
