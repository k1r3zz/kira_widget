import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_container.dart';

class KCContainer extends StatefulWidget {
  KCContainer(
      {required this.width,
      required this.height,
      this.offset = Offset.zero,
      required this.child,
      this.color = const Color(0x80333333),
      required this.pointController,
      this.decoration,
      this.border,
      this.background,
      this.radius = 0,
      Key? key})
      : assert(width != null),
        assert(height != null),
        assert(pointController != null),
        assert(child != null),
        super(key: key);

  ///widegt width
  final double width;

  ///widegt width
  final double height;

  ///widegt child can not null
  final Widget child;

  ///widegt start location
  final Offset offset;

  ///cover part background
  final ImageProvider? background;

  ///cover part radius
  final double radius;

  ///cover part border
  final BoxBorder? border;

  ///cover part decoration
  final Decoration? decoration;

  ///cover part color
  final Color color;

  final PointController pointController;

  @override
  _kCContainerState createState() => _kCContainerState();
}

class PointController {
  AnimationController? animationController;
  double isOpen = 0;

  openView() {
    if (animationController != null) {
      if (isOpen == 0) {
        isOpen = 1;
        animationController!.forward();
      } else {
        isOpen = 0;
        animationController!.reverse();
      }
    }
  }
}

// ignore: camel_case_types
class _kCContainerState extends State<KCContainer>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation animation;

  double? cWidth;
  double? long;

  @override
  void initState() {
    long = sqrt(widget.width * widget.width + widget.height * widget.height);
    cWidth = 0.0;
    // TODO: implement initState
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this)
          ..addListener(() {
            setState(() {
              cWidth = animation.value;
            });
          });

    animation = Tween(begin: 0.0, end: long).animate(_animationController!);
    widget.pointController.animationController = _animationController;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.pointController.isOpen == 0) {
          widget.pointController.isOpen = 1;
          _animationController!.forward();
        } else {
          widget.pointController.isOpen = 0;
          _animationController!.reverse();
        }
      },
      child: ClipPath(
          clipper: CirclePath(animation.value, widget.offset),
          child: KContainer(
            width: widget.width,
            height: widget.height,
            decoration: widget.decoration == null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    color: widget.color,
                    image: widget.background != null
                        ? DecorationImage(
                            image: widget.background!, fit: BoxFit.fill)
                        : null,
                    border: widget.border)
                : widget.decoration,
            child: widget.child,
          )),
    );
  }
}

class CirclePath extends CustomClipper<Path> {
  CirclePath(this.width, this.offset);

  double width;
  Offset offset;

  @override
  Path getClip(Size size) {
    var path = Path();
    Rect rect = Rect.fromCircle(center: offset, radius: width);
    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
