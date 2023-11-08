import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_entity.g.dart';

part 'diary_entity.freezed.dart';

@freezed
class DiaryEntity with _$DiaryEntity {
  const factory DiaryEntity(
      {int? diaryIdx,
      int? emotion,
      String? diaryContent,
      String? diaryImgUrl,
      String? date}) = _DiaryEntity;

  const DiaryEntity._();

  factory DiaryEntity.fromJson(Map<String, dynamic> json) =>
      _$DiaryEntityFromJson(json);
}
