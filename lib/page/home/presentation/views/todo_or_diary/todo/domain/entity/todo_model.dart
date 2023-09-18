import 'package:hive/hive.dart';
import 'package:monglee/util/constants.dart';

part 'todo_model.g.dart';

@HiveType(typeId: TODO_TYPE_ID)
class TodoModel extends HiveObject {
  @HiveField(0)
  final int? idx;
  @HiveField(1)
  final String? dateTime;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? contents;
  @HiveField(4)
  final String? startTime;
  @HiveField(5)
  final String? endTime;
  @HiveField(6)
  final String? location;
  @HiveField(7)
  bool selected;

  TodoModel(
      {this.idx,
        this.dateTime,
      this.title,
      this.contents,
      this.startTime,
      this.endTime,
      this.location,
      this.selected = false});
}
