import 'package:monglee/data/providers/local/todo_local_api.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:monglee/domain/repositories/todo_repository.dart';

class TodoLocalRepoImpl extends TodoRepository {
  @override
  void addTodoData(dynamic value) async {
    await TodoLocalAPI.add(value).request();
  }

  @override
  void deleteTodoData(dynamic key) async {
    await TodoLocalAPI.delete(key).request();
  }

  @override
  Future<Iterable<TodoEntity>?> getTodoList() async {
    dynamic data = await TodoLocalAPI.readAll().request();
    if (data is Iterable) {
      return data as Iterable<TodoEntity>;
    } else {
      return null;
    }
  }

  @override
  Future<TodoEntity?> getTodoData(dynamic key) async {
    dynamic data = await TodoLocalAPI.read(key).request();
    if (data != null) {
      return data as TodoEntity;
    } else {
      return null;
    }
  }
}
