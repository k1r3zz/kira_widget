import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/util/mColors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'kira_sword_loading.dart';
import 'kira_container.dart';

enum LoadingType {
  ///sword type for loading
  sword,

  ///sword type for circle
  circle,
}

// ignore: must_be_immutable
class KLoading extends StatelessWidget {
  ///loading size
  double? size;

  ///loading color
  Color? color;

  ///loading radius size
  double? radius;

  ///loading icon color
  Color? iconColor;

  ///loading text
  String? text;

  ///loading text color
  Color? textColor;

  ///loading text size
  double? textSize;

  ///loading type
  LoadingType? loadingType;

  KLoading(
      {this.color,
      this.size,
      this.iconColor,
      this.text,
      this.textColor,
      this.textSize,
      this.radius,
      this.loadingType});

  static void show(BuildContext context,
      {double? size,
      Color? color,
      Color? iconColor,
      String? text,
      double? textSize,
      Color? textColor,
      double? radius,
      LoadingType? loadingType = LoadingType.sword}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) => Container(
        color: Colors.transparent,
        child: KLoading(
          size: size,
          color: color,
          iconColor: iconColor,
          text: text,
          textColor: textColor,
          textSize: textSize,
          loadingType: loadingType,
          radius: radius,
        ),
      ),
    );
  }

  static void dismiss(context, {int isMayBe = 0}) {
    if (isMayBe == 1) {
      Navigator.maybePop(context);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: KContainer(
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(radius ?? 5),
          ),
          width: size ?? 100,
          height: size ?? 100,
          alignment: Alignment.center,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loadingType == LoadingType.sword
                  ? SwordLoading(
                      size: 60,
                      loadColor: iconColor ?? mColors.c_1BB1E6,
                    )
                  : SpinKitFadingCircle(
                      color: iconColor ?? mColors.c_1BB1E6,
                      size: 45,
                    ),
              text != null
                  ? SizedBox(
                      height: 4,
                    )
                  : Container(),
              text != null
                  ? KText(
                      text,
                      size: textSize ?? 14,
                      color: textColor ?? mColors.c_999999,
                      decoration: TextDecoration.none,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
