import 'package:hive/hive.dart';
import 'package:monglee/util/constants.dart';

part 'diary_model.g.dart';

@HiveType(typeId: DIARY_TYPE_ID)
class DiaryModel {
  @HiveField(0)
  final DateTime? dateTime;
  @HiveField(1)
  final String? cottonType;
  @HiveField(2)
  final String? imgUrl;
  @HiveField(3)
  final String? contents;

  DiaryModel({this.dateTime, this.cottonType, this.imgUrl, this.contents});
}
