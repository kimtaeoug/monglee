import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

extension ImageUtil on ImagePicker{
  static Future<XFile?> pick()async{
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }
  static Future<Uint8List> saveToUint8List(XFile xFile) async{
    return await xFile.readAsBytes();
  }
}