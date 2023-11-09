import 'package:monglee/data/providers/local_request_representable.dart';
import 'package:monglee/data/providers/provider.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/entities/setting_entity.dart';
import 'package:monglee/domain/entities/todo_entity.dart';

class SettingLocalAPI extends LocalRequestRepresentable {
  final LocalMethod method;

  final SettingEntity? s;
  SettingLocalAPI._({required this.method, this.s});

  SettingLocalAPI.read() : this._(method: LocalMethod.read);

  SettingLocalAPI.insert(SettingEntity? s) : this._(method: LocalMethod.insert, s: s);

  SettingLocalAPI.delete(SettingEntity? s) : this._(method: LocalMethod.delete, s: s);

  SettingLocalAPI.update(SettingEntity? s) : this._(method: LocalMethod.update, s: s);

  @override
  LocalMethod get localMethod => method;

  @override
  Future request() => Provider.instance.requestLocal(this);

  @override
  DiaryEntity? get diaryEntity => null;

  @override
  LocalTable get localTable => LocalTable.setting;

  @override
  TodoEntity? get todoEntity => null;

  @override
  SettingEntity? get settingEntity => s;
}