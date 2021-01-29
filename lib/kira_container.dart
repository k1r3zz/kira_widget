import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_bool_widget.dart';
import 'package:flutter_kira/util/mColors.dart';

class KContainer extends StatelessWidget {
  KContainer({
    this.margin = 0,
    this.rightMargin = 0,
    this.topMargin = 0,
    this.buttomMargin = 0,
    this.leftMargin = 0,
    this.padding = 0,
    this.leftPadding = 0,
    this.buttomPadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
    this.height,
    this.width,
    this.radius = 0,
    this.decoration,
    this.border,
    this.child,
    this.background,
    this.onClick,
    this.color = const Color(0x00ffffff),
    this.alignment = Alignment.center,
    Key key,
  }) : super(key: key);

  final double margin;
  final double rightMargin;
  final double topMargin;
  final double buttomMargin;
  final double leftMargin;
  final double padding;
  final double rightPadding;
  final double topPadding;
  final double buttomPadding;
  final double leftPadding;
  final Color color;
  final double width;
  final double height;
  final Alignment alignment;
  final Widget child;
  final ImageProvider background;
  final double radius;
  final BoxBorder border;
  Decoration decoration;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return KBoolWeight(
      kBool: onClick != null,
      firstChild: GestureDetector(
        onTap: onClick,
        child: buildContainer(),
      ),
      secondChild: buildContainer(),
    );
  }

  ///Container主体
  Container buildContainer() {
    return Container(
      margin: EdgeInsets.only(
          left: leftMargin == 0 ? margin : leftMargin,
          top: topMargin == 0 ? margin : topMargin,
          right: rightMargin == 0 ? margin : rightMargin,
          bottom: buttomMargin == 0 ? margin : buttomMargin),
      padding: EdgeInsets.only(
          left: leftPadding == 0 ? padding : leftPadding,
          top: topPadding == 0 ? padding : topPadding,
          right: rightPadding == 0 ? padding : rightPadding,
          bottom: buttomPadding == 0 ? padding : buttomPadding),
      width: width,
      height: height,
      alignment: alignment,
      decoration: decoration == null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: color,
              image: background != null
                  ? DecorationImage(image: background, fit: BoxFit.fill)
                  : null,
              border: border)
          : decoration,
      child: child,
    );
  }
}
