import 'package:flutter/material.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'monglee_skeleton.dart';

class TextSkeleton extends StatelessWidget {
  final double width;
  final double height;

  const TextSkeleton({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: MongleeSkeleton.fromColors(
            baseColor: skeletonBaseColor,
            highlightColor: skeletonHighLightColor,
            child: Container(
              width: width,
              height: height,
              color: Colors.white,
            )),
      ),
    );
  }
}
