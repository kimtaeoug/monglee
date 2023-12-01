// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      title: json['title'] as String?,
      contents: json['contents'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      location: json['location'] as String?,
      repeatIdx: json['repeatIdx'] as int?,
      notiIdx: json['notiIdx'] as int?,
      participant: (json['participant'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      selected: json['selected'] as bool?,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'title': instance.title,
      'contents': instance.contents,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'location': instance.location,
      'repeatIdx': instance.repeatIdx,
      'notiIdx': instance.notiIdx,
      'participant': instance.participant,
      'selected': instance.selected,
    };
