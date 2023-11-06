import 'package:hive/hive.dart';
import 'package:monglee/util/constants.dart';

part 'todo_model.g.dart';

@HiveType(typeId: TODO_TYPE_ID)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String? dateTime;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? contents;
  @HiveField(3)
  final String? startTime;
  @HiveField(4)
  final String? endTime;
  @HiveField(5)
  final String? location;
  @HiveField(6)
  final int? repeatIdx;
  @HiveField(7)
  final int? notiIdx;
  @HiveField(8)
  final List<String>? participant;
  @HiveField(9)
  bool selected;

  TodoModel(
      {this.dateTime,
      this.title,
      this.contents,
      this.startTime,
      this.endTime,
      this.location,
      this.repeatIdx,
      this.notiIdx,
      this.participant,
      this.selected = false});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      dateTime: json['datetime'],
      title: json['title'],
      contents: json['contents'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      location: json['location'],
      repeatIdx: json['repeatIdx'],
      notiIdx: json['notiIdx'],
      participant: json['participant']);
}
