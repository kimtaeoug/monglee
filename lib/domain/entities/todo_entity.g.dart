// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoEntityImpl _$$TodoEntityImplFromJson(Map<String, dynamic> json) =>
    _$TodoEntityImpl(
      todo_id: json['todo_id'] as int?,
      date: json['date'] as String?,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
      title: json['title'] as String?,
      todo_content: json['todo_content'] as String?,
      place: json['place'] as String?,
      alarm: json['alarm'] as String?,
      repeat: json['repeat'] as String?,
      companion: json['companion'] as String?,
    );

Map<String, dynamic> _$$TodoEntityImplToJson(_$TodoEntityImpl instance) =>
    <String, dynamic>{
      'todo_id': instance.todo_id,
      'date': instance.date,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'title': instance.title,
      'todo_content': instance.todo_content,
      'place': instance.place,
      'alarm': instance.alarm,
      'repeat': instance.repeat,
      'companion': instance.companion,
    };
