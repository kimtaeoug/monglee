import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monglee/data/models/todo_model.dart';

part 'search_item_model.freezed.dart';

part 'search_item_model.g.dart';

@freezed
class SearchItemModel with _$SearchItemModel {
  const factory SearchItemModel(
      {required String imgUrl,
      required String nickName,
      required String mbti,
      required List<TodoModel> todoList}) = _SearchItemModel;

  const SearchItemModel._();

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchItemModelFromJson(json);
}
