
import 'package:monglee/domain/entities/diary_entity.dart';

abstract class DiaryRepository{
  Future<List<DiaryEntity>?> read(DiaryEntity? d);
  Future<dynamic> insert(DiaryEntity? d);
}