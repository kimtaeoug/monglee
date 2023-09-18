import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';
import 'dart:ui';

class MognleeToast {
  //
// enum ToastType { check, error, upload }
//
// void tunegemToast(
// {required BuildContext context,
// required String msg,
// ToastType type = ToastType.check}) {
// FToast fToast = FToast();
// fToast.init(context);
// fToast.showToast(
// child: _tunegemToastContent(type, msg),
// positionedToastBuilder: (context, child) {
// return Positioned(
// child: child,
// top: MediaQueryData.fromWindow(window).padding.top,
// );
// });
// }
  static final Logger logger = Logger(
    printer: PrettyPrinter()
  );
  static void show({required BuildContext context, required String msg}) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
        child: _mongleeToast(msg),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: MediaQueryData.fromView(
                    WidgetsBinding.instance.platformDispatcher.views.single)
                .padding
                .top,
          );
        });
  }

  static Widget _mongleeToast(String msg) {
    return Container(
      width: Get.width - 48,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: gray500.withOpacity(0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            msg,
            style: Styler.style(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          )
        ],
      ),
    );
  }
}
