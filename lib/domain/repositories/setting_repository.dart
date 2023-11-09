import 'package:monglee/domain/entities/setting_entity.dart';

abstract class SettingRepository {
  Future<List<SettingEntity>?> read();

  Future insert(SettingEntity? s);

  Future update(SettingEntity? s);
}
