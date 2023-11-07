import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monglee/domain/entities/todo_entity.dart';

part 'todo_model.freezed.dart';

part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel(
      {DateTime? dateTime,
      String? title,
      String? contents,
      String? startTime,
      String? endTime,
      String? location,
      int? repeatIdx,
      int? notiIdx,
      List<String>? participant,
      bool? selected}) = _TodoModel;

  const TodoModel._();

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  factory TodoModel.fromHive(TodoEntity todoEntity) => TodoModel(
      dateTime: todoEntity.dateTime,
      title: todoEntity.title,
      contents: todoEntity.contents,
      startTime: todoEntity.startTime,
      endTime: todoEntity.endTime,
      location: todoEntity.location,
      repeatIdx: todoEntity.repeatIdx,
      notiIdx: todoEntity.notiIdx,
      participant: todoEntity.participant);
}
