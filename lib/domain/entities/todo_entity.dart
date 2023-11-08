import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    int? todo_id,
    String? date,
    String? start_time,
    String? end_time,
    String? title,
    String? todo_content,
    String? place,
    String? alarm,
    String? repeat,
    String? companion
  }) = _TodoEntity;

  // const TodoEntity._();
  factory TodoEntity.fromJson(Map<String, dynamic> json) => _$TodoEntityFromJson(json);
}
