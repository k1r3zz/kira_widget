import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_bool_widget.dart';

///quick use Container
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
    this.alignment,
    Key? key,
  }) : super(key: key);

  ///margin all use double
  final double margin;

  ///margin right use double if you not assignment use [margin] value
  final double rightMargin;

  ///margin top use double if you not assignment use [margin] value
  final double topMargin;

  ///margin buttom use double if you not assignment use [margin] value
  final double buttomMargin;

  ///margin left use double if you not assignment use [margin] value
  final double leftMargin;

  ///padding all use double
  final double padding;

  ///padding right use double if you not assignment use [margin] value
  final double rightPadding;

  ///padding top use double if you not assignment use [margin] value
  final double topPadding;

  ///padding buttom use double if you not assignment use [margin] value
  final double buttomPadding;

  ///padding left use double if you not assignment use [margin] value
  final double leftPadding;

  ///same as Container Color but if use [decoration] this attribute can not take effect
  final Color color;

  ///same as Container width
  final double? width;

  ///same as Container height
  final double? height;

  ///same as Container alignment
  final Alignment? alignment;

  ///same as Container child
  final Widget? child;

  ///set background for Container
  final ImageProvider? background;

  ///set all rounded corners use double
  ///if you want set one rounded corner you can set  [decoration]
  final double radius;

  ///set BoxBorder to BoxDecoration the same as Container
  final BoxBorder? border;

  ///set Decoration  the same as Container
  final Decoration? decoration;

  ///if you set onClick Container use GestureDetector
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    ///judge need not to need set GestureDetector for Container
    ///use KBoolWeight judge details for Widget KBoolWeight
    return KBoolWeight(
      kBool: onClick != null,
      firstChild: GestureDetector(
        onTap: onClick as void Function()?,
        child: buildContainer(),
      ),
      secondChild: buildContainer(),
    );
  }

  ///use Container
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
                  ? DecorationImage(image: background!, fit: BoxFit.fill)
                  : null,
              border: border)
          : decoration,
      child: child,
    );
  }
}
