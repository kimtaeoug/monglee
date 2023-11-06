import 'package:hive/hive.dart';
import 'package:monglee/app/config/constants.dart';

part 'diary_entity.g.dart';

@HiveType(typeId: DIARY_TYPE_ID)
class DiaryEntity {
  @HiveField(0)
  final int? idx;
  @HiveField(1)
  final DateTime? dateTime;
  @HiveField(2)
  final String? cottonType;
  @HiveField(3)
  final String? imgUrl;
  @HiveField(4)
  final String? contents;

  DiaryEntity({this.idx, this.dateTime, this.cottonType, this.imgUrl, this.contents});
}
