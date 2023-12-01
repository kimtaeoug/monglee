import 'dart:async';
import 'package:get/get.dart';
import 'package:monglee/app/services/mongle_service.dart';
import 'package:monglee/app/util/monglee_logger.dart';
import 'package:monglee/data/providers/local_request_representable.dart';

import 'local/local_db_helper.dart';

class Provider {
  static final _singleTon = Provider();

  static Provider get instance => _singleTon;

  Future requestLocal(LocalRequestRepresentable request) async {
    try {
      final storage = Get.find<MongleeService>();
      switch (request.localTable) {
        case LocalTable.todo:
          return LocalDBHelper(
                  db: storage.db,
                  method: request.localMethod,
                  t: request.todoEntity)
              .requestTodo();
        case LocalTable.diary:
          return LocalDBHelper(
                  db: storage.db,
                  method: request.localMethod,
                  d: request.diaryEntity)
              .requestDiary();
        case LocalTable.setting:
          return LocalDBHelper(
                  db: storage.db,
                  method: request.localMethod,
                  s: request.settingEntity)
              .requestSetting();
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
