import 'package:get/get.dart';
import 'package:monglee/domain/usecases/setting_usecase.dart';

class SettingController extends GetxController{
  final SettingUseCase settingUseCase;
  SettingController(this.settingUseCase);


  // void initSettingData()async{
  //   List<SettingEntity> data = await settingUseCase.read() ?? [];
  //   if(data.isNotEmpty){
  //     profileImg.value = data.first.profile_img_url ?? '';
  //     nickName.value = data.
  //     // settingData.value = data.first;
  //     // profileImg.value = settingData.value.profile_img_url;
  //   }
  // }
  // RxString profileImg = ''.obs;
  // RxString nickName = ''.obs;
  // RxString mbti = ''.obs;
  // RxString open = ''.obs;
  // void insertSettingData()async{
  //
  // }
  //String? profile_img_url,
//       String? alarm,
//       String? nickname,
//       String? mbti,
//       String? is_public
}