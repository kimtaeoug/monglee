class SettingItemModel {
  final String title;
  final Function() function;
  final SettingItemType type;

  SettingItemModel(
      {required this.title,
      required this.function,
      this.type = SettingItemType.basic});
}

enum SettingItemType { basic, toggle, version }
