import 'package:monglee/page/home/views/todo_or_diary/todo/domain/entity/todo_model.dart';

class SearchItemModel{
  final String imgUrl;
  final String nickName;
  final String mbti;
  final List<TodoModel> todoList;
  SearchItemModel({required this.imgUrl, required this.nickName, required this.mbti, required this.todoList});
}