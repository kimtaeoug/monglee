import 'package:monglee/domain/entities/setting_entity.dart';
import 'package:monglee/domain/repositories/setting_repository.dart';

class SettingUseCase {
  final SettingRepository _repository;

  SettingUseCase(this._repository);

  Future<List<SettingEntity>?> read() async {
    return await _repository.read();
  }

  Future<int?> insert(SettingEntity? s) async {
    return await _repository.insert(s);
  }

  Future<int?> update(SettingEntity? s) async {
    return await _repository.update(s);
  }
}
