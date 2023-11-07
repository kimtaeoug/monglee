import 'package:monglee/data/models/todo_model.dart';
import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:monglee/domain/repositories/todo_repository.dart';

class TodoUseCase {
  final TodoRepository _repository;

  TodoUseCase(this._repository);

  Future<TodoEntity?> getData(dynamic key) async {
    return await _repository.getTodoData(key);
  }

  Future<Iterable<TodoEntity>?> getDataAll() async {
    return await _repository.getTodoList();
  }

  void addData(dynamic value) async {
    _repository.addTodoData(value);
  }

  void deleteData(dynamic key) {
    _repository.deleteTodoData(key);
  }
}
