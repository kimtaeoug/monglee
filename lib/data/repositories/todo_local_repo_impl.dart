import 'package:monglee/data/providers/local/todo/todo_local_api.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:monglee/domain/repositories/todo_repository.dart';

class TodoLocalRepoImpl extends TodoRepository {
  @override
  Future<int?> delete(TodoEntity? t) async {
    return await TodoLocalAPI.delete(t).request();
  }

  @override
  Future insert(TodoEntity? t) async {
    return await TodoLocalAPI.insert(t).request();
  }

  @override
  Future<List<TodoEntity>?> read(TodoEntity? t) async {
    List<Map<String, dynamic>>? data = await TodoLocalAPI.read(t).request();
    if (data != null) {
      List<TodoEntity> result = [];
      for (Map<String, dynamic> element in data) {
        result.add(TodoEntity.fromJson(element));
      }
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<int?> update(TodoEntity? t) async {
    return await TodoLocalAPI.update(t).request();
  }
}
