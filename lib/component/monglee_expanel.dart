import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class MongleeExpanel extends StatefulWidget {
  final String title;
  final List<Widget> items;

  MongleeExpanel({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MongleeExpanel();
}

class _MongleeExpanel extends State<MongleeExpanel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              widget.title,
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
          children: widget.items,
        ),
      ),
    );
  }
}