import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

///Automatically play of text
class KAutoText extends StatefulWidget {
  KAutoText(
    this.title, {
    Key? key,
    required this.duration,
    required this.kTextController,
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

  ///the same as KText
  final String title;

  ///the same as KText
  final Color color;

  ///the same as KText
  final double size;

  ///the same as KText
  final TextAlign align;

  ///the same as KText
  final FontWeight fontWeight;

  ///the same as KText
  final double? maxsize;

  ///the same as KText
  final double? minsize;

  ///the same as KText
  final List<double>? fontlist;

  ///the same as KText
  final int? maxline;

  ///the same as KText
  final TextOverflow textOverflow;

  ///controller AutoText time
  final Duration duration;

  ///controller of AutoText
  final KTextController kTextController;

  @override
  _KAutoTextState createState() => _KAutoTextState();
}

class KTextController {
  AnimationController? animationController;
  late Function onCompleted;

  ///start AutoText
  start() {
    if (animationController != null) {
      animationController!.forward();
    }
  }

  ///when AutoText completed
  addCompleted(Function completed) {
    onCompleted = completed;
  }
}

class _KAutoTextState extends State<KAutoText>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation animation;
  String str = "";

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..addListener(() {
            double temp = animation.value;
            setState(() {
              str = widget.title.substring(0, temp.floor());
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (null != widget.kTextController.onCompleted()) {
                widget.kTextController.onCompleted();
              }
            }
          });
    animation = Tween(begin: 0.0, end: (widget.title).length.toDouble())
        .animate(_animationController!);
    widget.kTextController.animationController = _animationController;
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
    return AutoSizeText(str,
        textAlign: widget.align,
        style: TextStyle(
          color: widget.color,
          fontSize: widget.size,
          fontWeight: widget.fontWeight,
        ),
        overflow: widget.textOverflow,
        maxLines: widget.maxline,
        maxFontSize: widget.maxsize == 0 ? widget.size : widget.maxsize ?? 0,
        minFontSize: widget.minsize == 0 ? widget.size : widget.minsize ?? 0,
        presetFontSizes: widget.fontlist ?? [widget.size]);
  }
}
