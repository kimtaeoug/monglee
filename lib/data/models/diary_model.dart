import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_model.freezed.dart';

part 'diary_model.g.dart';

@freezed
class DiaryModel with _$DiaryModel {
  factory DiaryModel(
      {required int? idx,
      required DateTime? dateTime,
      required String? cottonType,
      required String? imgUrl,
      required String? contents}) = _DiaryModel;

  factory DiaryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryModelFromJson(json);
}
