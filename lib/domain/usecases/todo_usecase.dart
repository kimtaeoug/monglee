import 'package:monglee/domain/entities/todo_entity.dart';
import 'package:monglee/domain/repositories/todo_repository.dart';

class TodoUseCase {
  final TodoRepository _repository;

  TodoUseCase(this._repository);

  Future<List<TodoEntity>?> read(TodoEntity? t) async {
    return await _repository.read(t);
  }

  Future<int?> insert(TodoEntity? t) async {
    return await _repository.insert(t);
  }
  Future<int?> update(TodoEntity? t) async{
    return await _repository.update(t);
  }
  Future<int?> delete(TodoEntity? t)async{
    return await _repository.delete(t);
  }
}
