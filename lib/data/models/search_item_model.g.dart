// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchItemModelImpl _$$SearchItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchItemModelImpl(
      imgUrl: json['imgUrl'] as String,
      nickName: json['nickName'] as String,
      mbti: json['mbti'] as String,
      todoList: (json['todoList'] as List<dynamic>)
          .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchItemModelImplToJson(
        _$SearchItemModelImpl instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'nickName': instance.nickName,
      'mbti': instance.mbti,
      'todoList': instance.todoList,
    };
