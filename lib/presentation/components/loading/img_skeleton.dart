import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/component/loading/monglee_skeleton.dart';

class ImgSkeleton extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  ImgSkeleton(
      {Key? key,
      required this.width,
      required this.height,
      required this.borderRadius,})
      : super(key: key);

  final Color baseColor = Color(0xffF0F0F0);
  final Color highLightColor = Color(0xffE1E1E1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: _skeletone(),
      ),
    );
  }

  Widget _skeletone() {
    return MongleeSkeleton.fromColors(
        baseColor: baseColor,
        highlightColor: highLightColor,
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
        ));
  }
}
