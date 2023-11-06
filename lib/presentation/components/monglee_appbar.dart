import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';

class MongleeAppBar{
  ///
  /// 뒤로가기만 있는 appbar
  ///
  static AppBar onlyBack({Function()? function}){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: SizedBox(
        width: 24,
        height: 24,
        child: IconButton(
          color: mineShatf,
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            if(function!=null){
              function.call();
            }else{
              Get.back();
            }
          },
        ),
      )
    );
  }
}