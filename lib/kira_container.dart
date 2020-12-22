import 'package:flutter/material.dart';
import 'package:flutter_kira/util/mColors.dart';

class KContainer extends StatelessWidget {
  KContainer({
    this.padding = 0,
    this.buttompadding,
    this.rightPadding,
    this.topPadding,
    this.height,
    this.width,
    this.radius,
    this.decoration,
    this.border,
    this.child,
    this.color = const Color(0xffffffff),
    this.alignment = Alignment.center,
    Key key,
  }) : super(key: key);

  final double padding;
  final double rightPadding;
  final double topPadding;
  final double buttompadding;
  final Color color;
  final double width;
  final double height;
  final Alignment alignment;
  final Widget child;
  final double radius;
  final BoxBorder border;
  Decoration decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: padding,
          top: topPadding == 0 ? padding : topPadding,
          right: rightPadding == 0 ? padding : rightPadding,
          bottom: buttompadding == 0 ? padding : buttompadding),
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          border: border),
      child: child,
    );
  }
}
