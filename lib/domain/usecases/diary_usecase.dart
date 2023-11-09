import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/repositories/diary_repository.dart';

class DiaryUseCase {
  final DiaryRepository _repository;

  DiaryUseCase(this._repository);

  Future<List<DiaryEntity>?> read(DiaryEntity? d) async {
    return await _repository.read(d);
  }

  Future<int?> insert(DiaryEntity? d) async {
    return await _repository.insert(d);
  }
}
