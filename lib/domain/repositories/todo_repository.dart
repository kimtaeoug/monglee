import 'package:monglee/domain/entities/todo_entity.dart';

abstract class TodoRepository{
  Future<Iterable<TodoEntity>?> getTodoList();
  Future<TodoEntity?> getTodoData(dynamic key);
  void addTodoData(dynamic value);
  void deleteTodoData(dynamic key);
}