// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) {
  return _DiaryModel.fromJson(json);
}

/// @nodoc
mixin _$DiaryModel {
  int? get idx => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  String? get cottonType => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String? get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryModelCopyWith<DiaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryModelCopyWith<$Res> {
  factory $DiaryModelCopyWith(
          DiaryModel value, $Res Function(DiaryModel) then) =
      _$DiaryModelCopyWithImpl<$Res, DiaryModel>;
  @useResult
  $Res call(
      {int? idx,
      DateTime? dateTime,
      String? cottonType,
      String? imgUrl,
      String? contents});
}

/// @nodoc
class _$DiaryModelCopyWithImpl<$Res, $Val extends DiaryModel>
    implements $DiaryModelCopyWith<$Res> {
  _$DiaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = freezed,
    Object? dateTime = freezed,
    Object? cottonType = freezed,
    Object? imgUrl = freezed,
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cottonType: freezed == cottonType
          ? _value.cottonType
          : cottonType // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryModelImplCopyWith<$Res>
    implements $DiaryModelCopyWith<$Res> {
  factory _$$DiaryModelImplCopyWith(
          _$DiaryModelImpl value, $Res Function(_$DiaryModelImpl) then) =
      __$$DiaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idx,
      DateTime? dateTime,
      String? cottonType,
      String? imgUrl,
      String? contents});
}

/// @nodoc
class __$$DiaryModelImplCopyWithImpl<$Res>
    extends _$DiaryModelCopyWithImpl<$Res, _$DiaryModelImpl>
    implements _$$DiaryModelImplCopyWith<$Res> {
  __$$DiaryModelImplCopyWithImpl(
      _$DiaryModelImpl _value, $Res Function(_$DiaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = freezed,
    Object? dateTime = freezed,
    Object? cottonType = freezed,
    Object? imgUrl = freezed,
    Object? contents = freezed,
  }) {
    return _then(_$DiaryModelImpl(
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cottonType: freezed == cottonType
          ? _value.cottonType
          : cottonType // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryModelImpl implements _DiaryModel {
  _$DiaryModelImpl(
      {required this.idx,
      required this.dateTime,
      required this.cottonType,
      required this.imgUrl,
      required this.contents});

  factory _$DiaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryModelImplFromJson(json);

  @override
  final int? idx;
  @override
  final DateTime? dateTime;
  @override
  final String? cottonType;
  @override
  final String? imgUrl;
  @override
  final String? contents;

  @override
  String toString() {
    return 'DiaryModel(idx: $idx, dateTime: $dateTime, cottonType: $cottonType, imgUrl: $imgUrl, contents: $contents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryModelImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.cottonType, cottonType) ||
                other.cottonType == cottonType) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idx, dateTime, cottonType, imgUrl, contents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryModelImplCopyWith<_$DiaryModelImpl> get copyWith =>
      __$$DiaryModelImplCopyWithImpl<_$DiaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryModelImplToJson(
      this,
    );
  }
}

abstract class _DiaryModel implements DiaryModel {
  factory _DiaryModel(
      {required final int? idx,
      required final DateTime? dateTime,
      required final String? cottonType,
      required final String? imgUrl,
      required final String? contents}) = _$DiaryModelImpl;

  factory _DiaryModel.fromJson(Map<String, dynamic> json) =
      _$DiaryModelImpl.fromJson;

  @override
  int? get idx;
  @override
  DateTime? get dateTime;
  @override
  String? get cottonType;
  @override
  String? get imgUrl;
  @override
  String? get contents;
  @override
  @JsonKey(ignore: true)
  _$$DiaryModelImplCopyWith<_$DiaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
