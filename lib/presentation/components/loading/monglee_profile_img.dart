import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monglee/app/config/moglee_color.dart';

import 'monglee_skeleton.dart';

class MongleeProfileImg extends StatelessWidget {
  final String url;
  final double radius;

  const MongleeProfileImg({Key? key, required this.url, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return _profileImg();
    } catch (e) {
      return _defaultImg();
    }
  }

  Widget _profileImg() {
    return SizedBox(
      width: radius,
      height: radius,
      child: url != ''
          ? ExtendedImage.network(
              url,
              width: radius,
              height: radius,
              fit: BoxFit.cover,
              loadStateChanged: (state) {
                if (state.extendedImageLoadState == LoadState.completed) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: state.completedWidget,
                  );
                } else if (state.extendedImageLoadState == LoadState.loading) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: MongleeSkeleton.fromColors(
                        baseColor: skeletonBaseColor,
                        highlightColor: skeletonHighLightColor,
                        child: Container(
                          width: radius,
                          height: radius,
                          color: Colors.white,
                        )),
                  );
                } else {
                  return SvgPicture.asset(
                      'assets/icons_1.5/ic_default_myprofile.svg');
                }
              },
            )
          : _defaultImg(),
    );
  }

  Widget _defaultImg() {
    return SizedBox(
      width: radius,
      height: radius,
      child: SvgPicture.asset('assets/icons_1.5/ic_default_myprofile.svg'),
    );
  }
}
