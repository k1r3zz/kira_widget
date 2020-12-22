import 'package:flutter/material.dart';
import 'package:flutter_kira/util/mColors.dart';

class KContainer extends StatelessWidget {
  KContainer({
    this.padding = 0,
    this.leftpadding = 0,
    this.buttompadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
    this.height = double.infinity,
    this.width = double.infinity,
    this.radius = 0,
    this.decoration,
    this.border,
    this.child,
    this.background,
    this.color = const Color(0x00ffffff),
    this.alignment = Alignment.center,
    Key key,
  }) : super(key: key);

  final double padding;
  final double rightPadding;
  final double topPadding;
  final double buttompadding;
  final double leftpadding;
  final Color color;
  final double width;
  final double height;
  final Alignment alignment;
  final Widget child;
  final Widget background;
  final double radius;
  final BoxBorder border;
  Decoration decoration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background != null ? Positioned.fill(child: background) : Container(),
        Container(
          padding: EdgeInsets.only(
              left: leftpadding == 0 ? padding : leftpadding,
              top: topPadding == 0 ? padding : topPadding,
              right: rightPadding == 0 ? padding : rightPadding,
              bottom: buttompadding == 0 ? padding : buttompadding),
          width: width,
          height: height,
          alignment: alignment,
          decoration: decoration == null
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: color,
                  border: border)
              : decoration,
          child: child,
        ),
      ],
    );
  }
}
