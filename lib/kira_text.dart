import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

///quick use Text
class KText extends StatelessWidget {
  KText(this.title,
      {Key? key,
      this.size = 16,
      this.align = TextAlign.start,
      this.color = const Color(0xff000000),
      this.fontWeight = FontWeight.normal,
      this.maxsize,
      this.fontlist,
      this.minsize,
      this.maxline,
      this.textOverflow = TextOverflow.clip,
      this.isZH = false,
      this.decoration})
      : super(key: key);

  ///same as Text
  ///The text to display.
  final String? title;

  ///set text color
  final Color color;

  ///set text size
  final double size;

  ///set TextAlign same as Text
  final TextAlign align;

  ///set text fontWeight
  final FontWeight fontWeight;

  ///set text maxsize
  final double? maxsize;

  ///set text minsize
  final double? minsize;

  ///set text size list big to small
  final List<double>? fontlist;

  ///set text maxline
  final int? maxline;

  ///set text textOverflow
  final TextOverflow textOverflow;

  ///set chinese
  ///TextStyle set height:1.1
  final bool isZH;

  ///set text decoration
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title!,
        textAlign: align,
        style: isZH
            ? TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                decoration: decoration,
                height: 1.1, //适配中文汉字居中
              )
            : TextStyle(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                decoration: decoration,
              ),
        overflow: textOverflow,
        maxLines: maxline,
        maxFontSize: maxsize == 0 ? size : maxsize ?? 0,
        minFontSize: minsize == 0 ? size : minsize ?? 0,
        presetFontSizes: fontlist ?? [size]);
  }
}
