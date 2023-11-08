import 'package:monglee/data/providers/local_request_representable.dart';
import 'package:monglee/data/providers/provider.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/entities/todo_entity.dart';

class TodoLocalAPI extends LocalRequestRepresentable {
  final LocalMethod method;
  final TodoEntity? t;

  TodoLocalAPI._({required this.method, this.t});

  TodoLocalAPI.read(TodoEntity? t) : this._(method: LocalMethod.read, t: t);

  TodoLocalAPI.insert(TodoEntity? t) : this._(method: LocalMethod.insert, t: t);

  TodoLocalAPI.delete(TodoEntity? t) : this._(method: LocalMethod.delete, t: t);

  TodoLocalAPI.update(TodoEntity? t) : this._(method: LocalMethod.update, t: t);

  @override
  LocalMethod get localMethod => method;

  @override
  Future request() => Provider.instance.requestLocal(this);

  @override
  DiaryEntity? get diaryEntity => null;

  @override
  LocalTable get localTable => LocalTable.todo;

  @override
  TodoEntity? get todoEntity => t;
}
