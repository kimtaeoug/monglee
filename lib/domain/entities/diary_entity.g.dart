// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryEntityImpl _$$DiaryEntityImplFromJson(Map<String, dynamic> json) =>
    _$DiaryEntityImpl(
      diary_id: json['diary_id'] as int?,
      emotion: json['emotion'] as int?,
      diary_content: json['diary_content'] as String?,
      diary_img_url: json['diary_img_url'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$DiaryEntityImplToJson(_$DiaryEntityImpl instance) =>
    <String, dynamic>{
      'diary_id': instance.diary_id,
      'emotion': instance.emotion,
      'diary_content': instance.diary_content,
      'diary_img_url': instance.diary_img_url,
      'date': instance.date,
    };
