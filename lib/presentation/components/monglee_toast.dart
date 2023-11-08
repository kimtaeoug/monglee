import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';

class MognleeToast {
  static final Logger logger = Logger(
    printer: PrettyPrinter()
  );
  static void show({required BuildContext context, required String msg}) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
        child: _mongleeToast(msg),
        positionedToastBuilder: (context, child2) {
          return Positioned(
            top: MediaQueryData.fromView(
                    WidgetsBinding.instance.platformDispatcher.views.single)
                .padding
                .top,
            child: child2,
          );
        });
  }

  static Widget _mongleeToast(String msg) {
    return Container(
      width: Get.width - 24,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 12),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: mineShatf),
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
