import 'package:monglee/app/extensions/mbti.dart';

enum SettingChangeType{
  mbti, font, theme
}
extension SettingTypeUtil on SettingChangeType{
  static List<String> getList(SettingChangeType type){
    switch(type){
      case SettingChangeType.mbti:
        return MBTIUtil.mbtilList();
      case SettingChangeType.font:
        return [];
      case SettingChangeType.theme:
        return [];
    }
  }
  static List<String> getTitleAndSubTitle(SettingChangeType type){
    switch(type){
      case SettingChangeType.mbti:
        return ['MBTI', '바꾸실 MBTI를 선택해주세요~'];
      case SettingChangeType.font:
        return ['FONT', '바꾸실 font를 선택해주세요~'];
      case SettingChangeType.theme:
        return  ['Theme', '바꾸실 Theme를 선택해주세요~'];
    }
  }
}