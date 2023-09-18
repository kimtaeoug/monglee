import 'package:flutter/cupertino.dart';

class MongleeKeyBoardUtil{
  ///
  /// Close Keyboard
  ///
  static void closeKeyBoard({required BuildContext context}){
    FocusScope.of(context).unfocus();
  }
}