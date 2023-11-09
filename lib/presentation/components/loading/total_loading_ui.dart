import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/presentation/components/loading/loading_widget/monglee_loading_widget.dart';

class TotalLoadingUI extends StatelessWidget {
  const TotalLoadingUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MongleeLoadingWidget(
                      size: 80, color: primaryColor.withOpacity(0.3)),
                  Text(
                    'Loading...',
                    style: Styler.style(
                        fontSize: 16,
                        fontType: FontType.uhbeeem,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
