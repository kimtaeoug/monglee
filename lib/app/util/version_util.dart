import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:yaml/yaml.dart';

class VersionUtil {
  static final VersionUtil _util = VersionUtil._();

  VersionUtil._();

  factory VersionUtil() => _util;

  final String _path = 'pubspec.yaml';

  final ValueNotifier<String> _version = ValueNotifier<String>('1.0.0');

  String get version => _version.value;

  void initAppVersion() {
    File file = File(_path);
    String contents = file.readAsStringSync();
    Map<String, dynamic> pubspec = loadYaml(contents);
    dynamic rawVersion = pubspec['version'];
    if (rawVersion is String) {
      _version.value = rawVersion;
    }
  }
}
