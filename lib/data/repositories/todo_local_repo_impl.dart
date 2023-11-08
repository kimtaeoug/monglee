import 'package:monglee/data/providers/local/todo_local_api.dart';
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
    List<Map>? data = await TodoLocalAPI.read(t).request();
    if (data != null) {
      return data as List<TodoEntity>;
    } else {
      return null;
    }
  }

  @override
  Future<int?> update(TodoEntity? t) async {
    return await TodoLocalAPI.update(t).request();
  }
}
