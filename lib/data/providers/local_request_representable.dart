import 'package:hive/hive.dart';
import 'package:monglee/app/util/monglee_logger.dart';

enum LocalMethod { getAll, get, add, put, delete }

enum LocalBox { todo, diary }

abstract class LocalRequestRepresentable {
  LocalBox get localBox;

  LocalMethod get localMethod;

  dynamic get key;

  dynamic get value;

  Future request();
}

class LocalDBProcess {
  final Box box;
  final LocalMethod localMethod;
  final dynamic key;
  final dynamic value;

  LocalDBProcess(
      {required this.box, required this.localMethod, this.key, this.value});

  dynamic process() {
    switch (localMethod) {
      case LocalMethod.getAll:
        return box.values;
      case LocalMethod.get:
        return box.get(key);
      case LocalMethod.add:
        return box.add(value);
      case LocalMethod.delete:
        return box.delete(key);
      case LocalMethod.put:
        return box.put(key, value);
    }
  }
}
