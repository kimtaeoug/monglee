// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryEntity _$DiaryEntityFromJson(Map<String, dynamic> json) {
  return _DiaryEntity.fromJson(json);
}

/// @nodoc
mixin _$DiaryEntity {
  int? get diary_id => throw _privateConstructorUsedError;
  int? get emotion => throw _privateConstructorUsedError;
  String? get diary_content => throw _privateConstructorUsedError;
  String? get diary_img_url => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryEntityCopyWith<DiaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryEntityCopyWith<$Res> {
  factory $DiaryEntityCopyWith(
          DiaryEntity value, $Res Function(DiaryEntity) then) =
      _$DiaryEntityCopyWithImpl<$Res, DiaryEntity>;
  @useResult
  $Res call(
      {int? diary_id,
      int? emotion,
      String? diary_content,
      String? diary_img_url,
      String? date});
}

/// @nodoc
class _$DiaryEntityCopyWithImpl<$Res, $Val extends DiaryEntity>
    implements $DiaryEntityCopyWith<$Res> {
  _$DiaryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diary_id = freezed,
    Object? emotion = freezed,
    Object? diary_content = freezed,
    Object? diary_img_url = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      diary_id: freezed == diary_id
          ? _value.diary_id
          : diary_id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as int?,
      diary_content: freezed == diary_content
          ? _value.diary_content
          : diary_content // ignore: cast_nullable_to_non_nullable
              as String?,
      diary_img_url: freezed == diary_img_url
          ? _value.diary_img_url
          : diary_img_url // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryEntityImplCopyWith<$Res>
    implements $DiaryEntityCopyWith<$Res> {
  factory _$$DiaryEntityImplCopyWith(
          _$DiaryEntityImpl value, $Res Function(_$DiaryEntityImpl) then) =
      __$$DiaryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? diary_id,
      int? emotion,
      String? diary_content,
      String? diary_img_url,
      String? date});
}

/// @nodoc
class __$$DiaryEntityImplCopyWithImpl<$Res>
    extends _$DiaryEntityCopyWithImpl<$Res, _$DiaryEntityImpl>
    implements _$$DiaryEntityImplCopyWith<$Res> {
  __$$DiaryEntityImplCopyWithImpl(
      _$DiaryEntityImpl _value, $Res Function(_$DiaryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diary_id = freezed,
    Object? emotion = freezed,
    Object? diary_content = freezed,
    Object? diary_img_url = freezed,
    Object? date = freezed,
  }) {
    return _then(_$DiaryEntityImpl(
      diary_id: freezed == diary_id
          ? _value.diary_id
          : diary_id // ignore: cast_nullable_to_non_nullable
              as int?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as int?,
      diary_content: freezed == diary_content
          ? _value.diary_content
          : diary_content // ignore: cast_nullable_to_non_nullable
              as String?,
      diary_img_url: freezed == diary_img_url
          ? _value.diary_img_url
          : diary_img_url // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryEntityImpl extends _DiaryEntity {
  const _$DiaryEntityImpl(
      {this.diary_id,
      this.emotion,
      this.diary_content,
      this.diary_img_url,
      this.date})
      : super._();

  factory _$DiaryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryEntityImplFromJson(json);

  @override
  final int? diary_id;
  @override
  final int? emotion;
  @override
  final String? diary_content;
  @override
  final String? diary_img_url;
  @override
  final String? date;

  @override
  String toString() {
    return 'DiaryEntity(diary_id: $diary_id, emotion: $emotion, diary_content: $diary_content, diary_img_url: $diary_img_url, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryEntityImpl &&
            (identical(other.diary_id, diary_id) ||
                other.diary_id == diary_id) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.diary_content, diary_content) ||
                other.diary_content == diary_content) &&
            (identical(other.diary_img_url, diary_img_url) ||
                other.diary_img_url == diary_img_url) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, diary_id, emotion, diary_content, diary_img_url, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryEntityImplCopyWith<_$DiaryEntityImpl> get copyWith =>
      __$$DiaryEntityImplCopyWithImpl<_$DiaryEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryEntityImplToJson(
      this,
    );
  }
}

abstract class _DiaryEntity extends DiaryEntity {
  const factory _DiaryEntity(
      {final int? diary_id,
      final int? emotion,
      final String? diary_content,
      final String? diary_img_url,
      final String? date}) = _$DiaryEntityImpl;
  const _DiaryEntity._() : super._();

  factory _DiaryEntity.fromJson(Map<String, dynamic> json) =
      _$DiaryEntityImpl.fromJson;

  @override
  int? get diary_id;
  @override
  int? get emotion;
  @override
  String? get diary_content;
  @override
  String? get diary_img_url;
  @override
  String? get date;
  @override
  @JsonKey(ignore: true)
  _$$DiaryEntityImplCopyWith<_$DiaryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
