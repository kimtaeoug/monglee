import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yaml/yaml.dart';

class VersionUtil {
  static final VersionUtil _util = VersionUtil._();

  VersionUtil._();

  factory VersionUtil() => _util;

  final String pubspecPath = '/pubspec.yaml';

  final ValueNotifier<String> _version = ValueNotifier<String>('1.0.0');

  String get version => _version.value;

  void initAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version.value = packageInfo.version;
  }
}
