class SettingItemModel {
  final String title;
  final Function() function;
  final SettingItemType type;
  final String? otherData;
  SettingItemModel(
      {required this.title,
      required this.function,
      this.type = SettingItemType.basic,
      this.otherData});
}

enum SettingItemType { basic, toggle, version }
