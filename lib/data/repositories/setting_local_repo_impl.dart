import 'package:monglee/data/providers/local/setting/setting_local_api.dart';
import 'package:monglee/domain/entities/setting_entity.dart';
import 'package:monglee/domain/repositories/setting_repository.dart';

class SettingLocalRepoImpl extends SettingRepository {
  @override
  Future insert(SettingEntity? s) async {
    return await SettingLocalAPI.insert(s).request();
  }

  @override
  Future<List<SettingEntity>?> read() async {
    List<Map<String, dynamic>>? data = await SettingLocalAPI.read().request();
    if (data != null) {
      List<SettingEntity> result = [];
      for (Map<String, dynamic> element in data) {
        result.add(SettingEntity.fromJson(element));
      }
      return result;
    } else {
      return null;
    }
  }

  @override
  Future update(SettingEntity? s) async {
    return await SettingLocalAPI.update(s).request();
  }
}
