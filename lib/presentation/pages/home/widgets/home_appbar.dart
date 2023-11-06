import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/presentation/pages/home/widgets/monglee_calendar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MongleeCaneldar();
  }

  @override
  Size get preferredSize =>
      Size(Get.width, 110 + AppBar().preferredSize.height);
}
