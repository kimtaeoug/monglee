import 'package:monglee/data/providers/local_request_representable.dart';
import 'package:monglee/data/providers/provider.dart';

class TodoLocalAPI extends LocalRequestRepresentable {
  final LocalMethod method;
  final dynamic key;
  final dynamic value;

  TodoLocalAPI._({required this.method, this.key, this.value});

  TodoLocalAPI.read(dynamic key) : this._(method: LocalMethod.get, key: key);

  TodoLocalAPI.readAll()
      : this._(
          method: LocalMethod.getAll,
        );

  TodoLocalAPI.add(dynamic value)
      : this._(method: LocalMethod.add, value: value);

  TodoLocalAPI.put(dynamic key, dynamic value)
      : this._(method: LocalMethod.put, key: key, value: value);

  TodoLocalAPI.delete(dynamic key)
      : this._(method: LocalMethod.delete, key: key);

  @override
  LocalBox get localBox => LocalBox.todo;

  @override
  LocalMethod get localMethod => method;

  @override
  Future request() => Provider.instance.requestLocal(this);
}
