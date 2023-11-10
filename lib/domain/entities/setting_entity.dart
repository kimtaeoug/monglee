import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_entity.g.dart';

part 'setting_entity.freezed.dart';

@freezed
class SettingEntity with _$SettingEntity {
  const factory SettingEntity({
    String? mbti,
    String? alarm,
    String? font,
    String? theme
  }) = _SettingEntity;
  // const factory SettingEntity(
  //     {String? profile_img_url,
  //     String? alarm,
  //     String? nickname,
  //     String? mbti,
  //     String? is_public}) = _SettingEntity;

  const SettingEntity._();

  factory SettingEntity.fromJson(Map<String, dynamic> json) =>
      _$SettingEntityFromJson(json);
}
