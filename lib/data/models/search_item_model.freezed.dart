// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchItemModel _$SearchItemModelFromJson(Map<String, dynamic> json) {
  return _SearchItemModel.fromJson(json);
}

/// @nodoc
mixin _$SearchItemModel {
  String get imgUrl => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get mbti => throw _privateConstructorUsedError;
  List<TodoModel> get todoList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchItemModelCopyWith<SearchItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemModelCopyWith<$Res> {
  factory $SearchItemModelCopyWith(
          SearchItemModel value, $Res Function(SearchItemModel) then) =
      _$SearchItemModelCopyWithImpl<$Res, SearchItemModel>;
  @useResult
  $Res call(
      {String imgUrl, String nickName, String mbti, List<TodoModel> todoList});
}

/// @nodoc
class _$SearchItemModelCopyWithImpl<$Res, $Val extends SearchItemModel>
    implements $SearchItemModelCopyWith<$Res> {
  _$SearchItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? nickName = null,
    Object? mbti = null,
    Object? todoList = null,
  }) {
    return _then(_value.copyWith(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      mbti: null == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String,
      todoList: null == todoList
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchItemModelImplCopyWith<$Res>
    implements $SearchItemModelCopyWith<$Res> {
  factory _$$SearchItemModelImplCopyWith(_$SearchItemModelImpl value,
          $Res Function(_$SearchItemModelImpl) then) =
      __$$SearchItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imgUrl, String nickName, String mbti, List<TodoModel> todoList});
}

/// @nodoc
class __$$SearchItemModelImplCopyWithImpl<$Res>
    extends _$SearchItemModelCopyWithImpl<$Res, _$SearchItemModelImpl>
    implements _$$SearchItemModelImplCopyWith<$Res> {
  __$$SearchItemModelImplCopyWithImpl(
      _$SearchItemModelImpl _value, $Res Function(_$SearchItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? nickName = null,
    Object? mbti = null,
    Object? todoList = null,
  }) {
    return _then(_$SearchItemModelImpl(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      mbti: null == mbti
          ? _value.mbti
          : mbti // ignore: cast_nullable_to_non_nullable
              as String,
      todoList: null == todoList
          ? _value._todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchItemModelImpl extends _SearchItemModel {
  const _$SearchItemModelImpl(
      {required this.imgUrl,
      required this.nickName,
      required this.mbti,
      required final List<TodoModel> todoList})
      : _todoList = todoList,
        super._();

  factory _$SearchItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchItemModelImplFromJson(json);

  @override
  final String imgUrl;
  @override
  final String nickName;
  @override
  final String mbti;
  final List<TodoModel> _todoList;
  @override
  List<TodoModel> get todoList {
    if (_todoList is EqualUnmodifiableListView) return _todoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoList);
  }

  @override
  String toString() {
    return 'SearchItemModel(imgUrl: $imgUrl, nickName: $nickName, mbti: $mbti, todoList: $todoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemModelImpl &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.mbti, mbti) || other.mbti == mbti) &&
            const DeepCollectionEquality().equals(other._todoList, _todoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imgUrl, nickName, mbti,
      const DeepCollectionEquality().hash(_todoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemModelImplCopyWith<_$SearchItemModelImpl> get copyWith =>
      __$$SearchItemModelImplCopyWithImpl<_$SearchItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchItemModelImplToJson(
      this,
    );
  }
}

abstract class _SearchItemModel extends SearchItemModel {
  const factory _SearchItemModel(
      {required final String imgUrl,
      required final String nickName,
      required final String mbti,
      required final List<TodoModel> todoList}) = _$SearchItemModelImpl;
  const _SearchItemModel._() : super._();

  factory _SearchItemModel.fromJson(Map<String, dynamic> json) =
      _$SearchItemModelImpl.fromJson;

  @override
  String get imgUrl;
  @override
  String get nickName;
  @override
  String get mbti;
  @override
  List<TodoModel> get todoList;
  @override
  @JsonKey(ignore: true)
  _$$SearchItemModelImplCopyWith<_$SearchItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
