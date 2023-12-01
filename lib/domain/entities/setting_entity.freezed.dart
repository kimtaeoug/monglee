// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingEntity _$SettingEntityFromJson(Map<String, dynamic> json) {
  return _SettingEntity.fromJson(json);
}

/// @nodoc
mixin _$SettingEntity {
  String? get mbti => throw _privateConstructorUsedError;
  String? get alarm => throw _privateConstructorUsedError;
  String? get font => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingEntityCopyWith<SettingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingEntityCopyWith<$Res> {
  factory $SettingEntityCopyWith(
          SettingEntity value, $Res Function(SettingEntity) then) =
      _$SettingEntityCopyWithImpl<$Res, SettingEntity>;
  @useResult
  $Res call({String? mbti, String? alarm, String? font, String? theme});
}

/// @nodoc
class _$SettingEntityCopyWithImpl<$Res, $Val extends SettingEntity>
    implements $SettingEntityCopyWith<$Res> {
  _$SettingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mbti = freezed,
    Object? alarm = freezed,
    Object? font = freezed,
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      mbti: freezed == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String?,
      alarm: freezed == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as String?,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingEntityImplCopyWith<$Res>
    implements $SettingEntityCopyWith<$Res> {
  factory _$$SettingEntityImplCopyWith(
          _$SettingEntityImpl value, $Res Function(_$SettingEntityImpl) then) =
      __$$SettingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? mbti, String? alarm, String? font, String? theme});
}

/// @nodoc
class __$$SettingEntityImplCopyWithImpl<$Res>
    extends _$SettingEntityCopyWithImpl<$Res, _$SettingEntityImpl>
    implements _$$SettingEntityImplCopyWith<$Res> {
  __$$SettingEntityImplCopyWithImpl(
      _$SettingEntityImpl _value, $Res Function(_$SettingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mbti = freezed,
    Object? alarm = freezed,
    Object? font = freezed,
    Object? theme = freezed,
  }) {
    return _then(_$SettingEntityImpl(
      mbti: freezed == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String?,
      alarm: freezed == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as String?,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingEntityImpl extends _SettingEntity {
  const _$SettingEntityImpl({this.mbti, this.alarm, this.font, this.theme})
      : super._();

  factory _$SettingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingEntityImplFromJson(json);

  @override
  final String? mbti;
  @override
  final String? alarm;
  @override
  final String? font;
  @override
  final String? theme;

  @override
  String toString() {
    return 'SettingEntity(mbti: $mbti, alarm: $alarm, font: $font, theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingEntityImpl &&
            (identical(other.mbti, mbti) || other.mbti == mbti) &&
            (identical(other.alarm, alarm) || other.alarm == alarm) &&
            (identical(other.font, font) || other.font == font) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mbti, alarm, font, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingEntityImplCopyWith<_$SettingEntityImpl> get copyWith =>
      __$$SettingEntityImplCopyWithImpl<_$SettingEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingEntityImplToJson(
      this,
    );
  }
}

abstract class _SettingEntity extends SettingEntity {
  const factory _SettingEntity(
      {final String? mbti,
      final String? alarm,
      final String? font,
      final String? theme}) = _$SettingEntityImpl;
  const _SettingEntity._() : super._();

  factory _SettingEntity.fromJson(Map<String, dynamic> json) =
      _$SettingEntityImpl.fromJson;

  @override
  String? get mbti;
  @override
  String? get alarm;
  @override
  String? get font;
  @override
  String? get theme;
  @override
  @JsonKey(ignore: true)
  _$$SettingEntityImplCopyWith<_$SettingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
