import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'kira_extension.dart';

class KAutoText extends StatefulWidget {
  KAutoText(
    this.title, {
    Key key,
    this.duration,
    this.kTextController,
    this.size = 16,
    this.align = TextAlign.start,
    this.color = const Color(0xff000000),
    this.fontWeight = FontWeight.normal,
    this.maxsize,
    this.fontlist,
    this.minsize,
    this.maxline,
    this.textOverflow = TextOverflow.clip,
  })  : assert(duration != null),
        assert(kTextController != null),
        super(key: key);

  final String title;
  final Color color;
  final double size;
  final TextAlign align;
  final FontWeight fontWeight;

  final double maxsize;
  final double minsize;
  List<double> fontlist;
  final int maxline;
  final TextOverflow textOverflow;
  final Duration duration;
  final KTextController kTextController;

  @override
  _KAutoTextState createState() => _KAutoTextState();
}

class KTextController {
  AnimationController animationController;
  Function onCompleted;

  start() {
    if (animationController != null) {
      animationController.forward();
    }
  }
}

class _KAutoTextState extends State<KAutoText>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation animation;
  String str = "";

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..addListener(() {
            setState(() {
              str = widget.title.substring(0, animation.value);
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.kTextController.onCompleted();
            }
          });
    animation = Tween(begin: 0.0, end: (widget.title).toDouble())
        .animate(_animationController);
    widget.kTextController.animationController = _animationController;
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
    return AutoSizeText(str,
        textAlign: widget.align,
        style: TextStyle(
          color: widget.color,
          fontSize: widget.size,
          fontWeight: widget.fontWeight,
        ),
        overflow: widget.textOverflow,
        maxLines: widget.maxline,
        maxFontSize: widget.maxsize == 0 ? widget.size : widget.maxsize,
        minFontSize: widget.minsize == 0 ? widget.size : widget.minsize,
        presetFontSizes: widget.fontlist ?? [widget.size]);
  }
}
