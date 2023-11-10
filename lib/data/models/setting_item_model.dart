
class SettingItemModel {
  final String title;
  final Function()? function;
  final SettingItemType? type;
  String? otherData;

  SettingItemModel(
      {required this.title,  this.function, this.type, this.otherData});
}

enum SettingItemType { basic, toggle, version }
