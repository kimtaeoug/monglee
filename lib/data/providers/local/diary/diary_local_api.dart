import 'package:monglee/data/providers/local_request_representable.dart';
import 'package:monglee/data/providers/provider.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/entities/todo_entity.dart';

class DiaryLocalAPI extends LocalRequestRepresentable {
  final LocalMethod method;
  final DiaryEntity? d;

  DiaryLocalAPI._({required this.method, this.d});

  DiaryLocalAPI.read(DiaryEntity? t) : this._(method: LocalMethod.read, d: t);

  DiaryLocalAPI.insert(DiaryEntity? t)
      : this._(method: LocalMethod.insert, d: t);

  @override
  LocalMethod get localMethod => method;

  @override
  Future request() => Provider.instance.requestLocal(this);

  @override
  DiaryEntity? get diaryEntity => d;

  @override
  LocalTable get localTable => LocalTable.todo;

  @override
  TodoEntity? get todoEntity => null;
}
