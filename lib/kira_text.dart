import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  KText(
      this.title, {
        Key key,
        this.size = 16,
        this.align = TextAlign.start,
        this.color = const Color(0xff000000),
        this.fontWeight = FontWeight.normal,
        this.maxsize,
        this.fontlist,
        this.minsize,
        this.maxline,
      }) : super(key: key);

  final String title;
  final Color color;
  final double size;
  final TextAlign align;
  final FontWeight fontWeight;

  final double maxsize;
  final double minsize;
  List<double> fontlist;
  final int maxline;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        textAlign: align,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
        maxLines: maxline,
        maxFontSize: maxsize == 0 ? size : maxsize,
        minFontSize: minsize == 0 ? size : minsize,
        presetFontSizes: fontlist ?? [size]);
  }
}