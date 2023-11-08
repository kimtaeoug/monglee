import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';

class MongleeExpanel extends StatelessWidget {
  final String title;
  final List<Widget> items;

  MongleeExpanel({Key? key, required this.title, required this.items})
      : super(key: key);

  final TextStyle _style =
      Styler.style(fontWeight: FontWeight.w600, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Stack(
        children: [
          ExpansionTile(
            shape: const Border(),
            collapsedShape: const Border(),
            tilePadding: EdgeInsets.zero,
            title: Text(
              title,
              style: _style,
            ),
            iconColor: gray300,
            collapsedIconColor: gray300,
            onExpansionChanged: (value) {},
            children: [_wrapChildren()],
          ),
          Positioned(
              top: 50,
              child: Container(
                width: Get.width,
                color: gray200,
                height: 0.5,
              ))
        ],
      ),
    );
  }

  Widget _wrapChildren() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: Get.width,
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          children: items,
        ),
      ),
    );
  }
}
