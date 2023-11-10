import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PrecacheImageUtil {
  static void _cachePng(String input, BuildContext context) async {
    await precacheImage(AssetImage(input), context);
  }

//asset에 있는 이미지들 미리 cache
  static void precacheImageFromAsset(BuildContext context) async {
    try {
      Map<String, dynamic> manifestMap = json.decode(await rootBundle.loadString('AssetManifest.json'));
      manifestMap.keys.forEach((element) {
        if (element.contains('.png')) {
          _cachePng(element, context);
        }
      });
    } catch (e) {
      print('Error : $e in precacheImageFromAsset');
    }
  }
}
