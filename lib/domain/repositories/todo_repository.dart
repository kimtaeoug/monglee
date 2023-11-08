import 'package:monglee/domain/entities/todo_entity.dart';

abstract class TodoRepository{
  Future<List<TodoEntity>?> read(TodoEntity? t);
  Future<dynamic> insert(TodoEntity? t);
  Future<int?> update(TodoEntity? t);
  Future<int?> delete(TodoEntity? t);
}