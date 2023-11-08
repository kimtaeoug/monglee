import 'package:freezed_annotation/freezed_annotation.dart';

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
}
