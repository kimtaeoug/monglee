import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/component/loading/monglee_skeleton.dart';

class TextSkeleton extends StatelessWidget {
  final double width;
  final double height;

  TextSkeleton({Key? key, required this.width, required this.height})
      : super(key: key);
  final Color baseColor = Color(0xffF0F0F0);
  final Color highLightColor = Color(0xffE1E1E1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: MongleeSkeleton.fromColors(
            baseColor: baseColor,
            highlightColor: highLightColor,
            child: Container(
              width: width,
              height: height,
              color: Colors.white,
            )),
      ),
    );
  }
}
