import 'package:flutter/material.dart';
import 'package:monglee/app/config/moglee_color.dart';

import 'monglee_skeleton.dart';

class ImgSkeleton extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const ImgSkeleton({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
  }) : super(key: key);

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
        baseColor: skeletonBaseColor,
        highlightColor: skeletonHighLightColor,
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
        ));
  }
}
