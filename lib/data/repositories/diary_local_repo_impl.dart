import 'package:monglee/data/providers/local/diary/diary_local_api.dart';
import 'package:monglee/domain/entities/diary_entity.dart';
import 'package:monglee/domain/repositories/diary_repository.dart';

class DiaryLocalRepoImpl extends DiaryRepository {
  @override
  Future insert(DiaryEntity? d) async {
    return await DiaryLocalAPI.insert(d).request();
  }

  @override
  Future<List<DiaryEntity>?> read(DiaryEntity? d) async {
    List<Map<String, dynamic>>? data = await DiaryLocalAPI.read(d).request();
    if (data != null) {
      List<DiaryEntity> result = [];
      for (Map<String, dynamic> element in data) {
        result.add(DiaryEntity.fromJson(element));
      }
      return result;
    } else {
      return null;
    }
  }
}
