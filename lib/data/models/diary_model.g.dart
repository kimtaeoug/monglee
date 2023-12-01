// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryModelImpl _$$DiaryModelImplFromJson(Map<String, dynamic> json) =>
    _$DiaryModelImpl(
      idx: json['idx'] as int?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      cottonType: json['cottonType'] as String?,
      imgUrl: json['imgUrl'] as String?,
      contents: json['contents'] as String?,
    );

Map<String, dynamic> _$$DiaryModelImplToJson(_$DiaryModelImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'dateTime': instance.dateTime?.toIso8601String(),
      'cottonType': instance.cottonType,
      'imgUrl': instance.imgUrl,
      'contents': instance.contents,
    };
