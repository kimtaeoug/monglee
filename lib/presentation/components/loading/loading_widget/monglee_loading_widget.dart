import 'package:flutter/cupertino.dart';
import 'package:monglee/presentation/components/animation/shake_animation.dart';
import 'package:monglee/presentation/components/loading/loading_widget/loading_background.dart';

class MongleeLoadingWidget extends StatelessWidget {
  final double size;
  final Color color;

  const MongleeLoadingWidget(
      {Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          LoadingBackground(size: size - 10, color: color),
          Center(
            child: ShakeAnimation(
              child: SizedBox(
                width: size * 2 / 5,
                height: size * 2 / 5,
                child: Image.asset('assets/images/cotton_3.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
