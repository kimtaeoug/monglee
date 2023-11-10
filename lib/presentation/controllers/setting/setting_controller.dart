import 'package:get/get.dart';
import 'package:monglee/domain/entities/setting_entity.dart';
import 'package:monglee/domain/usecases/setting_usecase.dart';

class SettingController extends GetxController {
  final SettingUseCase settingUseCase;

  SettingController(this.settingUseCase);

  RxString mbti = ''.obs;
  RxBool alarm = true.obs;
  RxString font = ''.obs;
  RxString theme = ''.obs;

  void initSettingData() async {
    List<SettingEntity> response = await settingUseCase.read() ?? [];
    if (response.isNotEmpty) {
      SettingEntity data = response.first;
      mbti.value = data.mbti ?? '';
      alarm.value = (data.alarm == 'true');
      font.value = data.font ?? '';
      theme.value = data.theme ?? '';
    }
  }

  void insertData() async {
    settingUseCase.insert(SettingEntity(
        mbti: mbti.value,
        alarm: alarm.value ? 'true' : 'false',
        font: font.value,
        theme: theme.value));
  }
}
