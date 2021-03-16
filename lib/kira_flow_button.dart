import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_container.dart';

enum FlowType {
  ///A quarter circle show child widget
  circle,

  ///horizontal show child widget
  horizontal,

  ///vertical show child widget
  vertical,
}

///Widget Button show child widgets for three type
class KFlowButton extends StatefulWidget {
  KFlowButton(
      {Key? key,
      required this.widgets,
      required this.width,
      required this.height,
      required this.child,
      this.duration,
      this.flowType = FlowType.circle})
      : assert(child != null),
        assert(widgets != null),
        assert(width != null),
        assert(height != null),
        super(key: key);

  ///button widget
  final Widget child;

  ///open button show all child widgets
  final List<Widget> widgets;

  ///this widget width
  ///advice width > [widgets]+[child] width
  final double width;

  ///this widget height
  ///advice height > [widgets]+[child] height
  final double height;

  ///the duration for open child widgets
  final Duration? duration;

  ///the type of KFlowButton [FlowType.circle] or [FlowType.vertical] or [FlowType.horizontal]
  final FlowType flowType;

  @override
  _kflowbuttonState createState() => _kflowbuttonState();
}

// ignore: camel_case_types
class _kflowbuttonState extends State<KFlowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  ///所有子空间集合
  late List _children;

  ///o是合上，1是打开
  int isOpen = 0;

  @override
  void initState() {
    // TODO: implement initState
    ///加入所有控件
    _children = widget.widgets;
    _children.add(GestureDetector(
      onTap: () {
        if (isOpen == 1) {
          isOpen = 0;
          _animationController.reverse();
        } else {
          isOpen = 1;
          _animationController.forward();
        }
      },
      child: widget.child,
    ));
    _animationController = AnimationController(
        vsync: this, duration: widget.duration ?? Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0)
        // .chain(CurveTween(curve: Curves.easeIn))
        .animate(_animationController);
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
    return KContainer(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Flow(
          delegate: flowDeges(_animation.value, widget.flowType),
          children: _children as List<Widget>,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class flowDeges extends FlowDelegate {
  double num;
  FlowType flowType;

  flowDeges(this.num, this.flowType);

  @override
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide;
    var count = context.childCount - 1;

    if (flowType == FlowType.circle) {
      var perRad = pi / 2 / count;

      for (int i = 0; i < count; i++) {
        var cSizeX = context.getChildSize(i)!.width / 2;
        var cSizeY = context.getChildSize(i)!.height / 2;

        var offsetX = -num * (radius - cSizeX) * sin(i * perRad + perRad / 2) +
            context.size.width;
        var offsetY = -num * (radius - cSizeY) * cos(i * perRad + perRad / 2) +
            context.size.height;

        context.paintChild(i,
            opacity: num,
            transform: Matrix4.translationValues(
                offsetX - cSizeX, offsetY - cSizeY, 0.0));
      }
    } else if (flowType == FlowType.vertical) {
      double tempH = (context.size.height -
              context.getChildSize(context.childCount - 1)!.height) /
          count;
      double oldH = context.size.height -
          context.getChildSize(context.childCount - 1)!.height;
      for (int i = 0; i < count; i++) {
        context.paintChild(i,
            opacity: num,
            transform: Matrix4.translationValues(
                context.size.width - context.getChildSize(i)!.width,
                oldH - tempH * (i + 1) * num,
                0.0));
      }
    } else if (flowType == FlowType.horizontal) {
      double tempW = (context.size.width -
              context.getChildSize(context.childCount - 1)!.width) /
          count;
      double oldW = context.size.width -
          context.getChildSize(context.childCount - 1)!.width;
      for (int i = 0; i < count; i++) {
        context.paintChild(i,
            opacity: num,
            transform: Matrix4.translationValues(oldW - tempW * (i + 1) * num,
                context.size.height - context.getChildSize(i)!.height, 0.0));
      }
    }

    context.paintChild(context.childCount - 1,
        transform: Matrix4.translationValues(
            context.size.width -
                context.getChildSize(context.childCount - 1)!.width,
            context.size.height -
                context.getChildSize(context.childCount - 1)!.height,
            0.0));
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
