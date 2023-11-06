import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/app/config/moglee_color.dart';

import 'monglee_skeleton.dart';

class MongleeNetWorkImage extends StatelessWidget {
  final String imgUrl;
  final double? imgWidth;
  final double? imgHeight;
  final BorderRadius? borderRadius;
  final BoxFit? boxFit;
  final Color? defaultColor;
  final double? ratio;
  final Alignment? alignment;
  final FilterQuality? filterQuality;
  final double? placeHolderHeight;

  MongleeNetWorkImage(
      {Key? key,
      required this.imgUrl,
      this.imgWidth,
      this.imgHeight,
      this.borderRadius,
      this.boxFit,
      this.defaultColor,
      this.ratio,
      this.alignment,
      this.filterQuality,
      this.placeHolderHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return _tunegemNetWorkImage();
    } catch (e) {
      return _placeHolder();
    }
  }

  Widget _tunegemNetWorkImage() {
    return ExtendedImage.network(
      imgUrl,
      width: imgWidth,
      height: imgHeight,
      fit: boxFit,
      alignment: alignment ?? Alignment.center,
      filterQuality: filterQuality ?? FilterQuality.high,
      cache: true,
      cacheRawData: true,
      loadStateChanged: (state) {
        if (state.extendedImageLoadState == LoadState.completed) {
          return ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: state.completedWidget,
          );
        } else {
          return _placeHolder();
        }
      },
    );
  }

  Widget _placeHolder() {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Container(
        width: imgWidth,
        height: placeHolderHeight ?? imgHeight,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.zero,
          color: defaultColor ?? Colors.transparent,
        ),
        child: MongleeSkeleton.fromColors(
            baseColor: skeletonBaseColor,
            highlightColor: skeletonHighLightColor,
            child: Container(
              width: imgWidth,
              height: imgHeight,
              color: defaultColor ?? Colors.white,
            )),
      ),
    );
  }
}
