import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_extension.dart';

enum Direction {
  horizontal,
  vertical,
}

///the Widegt can make Widegt run [Direction.horizontal] or [Direction.vertical]
class KWidgetRun extends StatefulWidget {
  KWidgetRun(
      {required this.child,
      this.duration,
      this.curve,
      this.direction = Direction.vertical,
      Key? key})
      : assert(child != null),
        super(key: key);

  ///same as Widget child but can not null
  final Widget child;

  ///set duration with the AnimationController
  final Duration? duration;

  ///set curve with the AnimationController
  final Curve? curve;

  ///set direction with the KWidgetRun [Direction.horizontal] or [Direction.vertical]
  final Direction direction;

  @override
  _KWidgetRunState createState() => _KWidgetRunState();
}

class _KWidgetRunState extends State<KWidgetRun>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  double tempNum = 0;

  late double tempX;
  late double tempY;

  @override
  void initState() {
    // TODO: implement initState
    tempX = 0;
    tempY = 0;

    _animationController = AnimationController(
        vsync: this, duration: widget.duration ?? Duration(milliseconds: 1000))
      ..addListener(() {
        double temp = _animation.value.toStringAsFixed(1).toString().toDouble();
        if (tempNum != temp) {
          tempNum = temp;

          setState(() {
            if (_animation.value < 5) {
              if (widget.direction == Direction.vertical) {
                tempY = tempNum;
              } else {
                tempX = tempNum;
              }
            } else {
              if (widget.direction == Direction.vertical) {
                tempY = 10 - tempNum;
              } else {
                tempX = 10 - tempNum;
              }
            }
          });
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          tempY = 0;
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animation = Tween(begin: 0.0, end: 10.0)
        .chain(CurveTween(curve: widget.curve ?? Curves.easeInOutCubic))
        .animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(tempX, tempY),
      child: widget.child,
    );
  }
}
