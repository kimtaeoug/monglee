import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    int? todoId,
    String? date,
    String? startTime,
    String? endTime,
    String? title,
    String? todoContent,
    String? place,
    String? alarm,
    String? repeat,
    String? companion
  }) = _TodoEntity;

  const TodoEntity._();
  factory TodoEntity.fromJson(Map<String, dynamic> json) => _$TodoEntityFromJson(json);

}
