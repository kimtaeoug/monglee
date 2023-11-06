import 'package:hive/hive.dart';
import 'package:monglee/app/config/constants.dart';

part 'todo_entity.g.dart';

@HiveType(typeId: TODO_TYPE_ID)
class TodoEntity extends HiveObject {
  @HiveField(0)
  final DateTime? dateTime;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? contents;
  @HiveField(3)
  final DateTime? startTime;
  @HiveField(4)
  final DateTime? endTime;
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

  TodoEntity(
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

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
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
