import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_bool_widget.dart';
import 'package:flutter_kira/r.dart';
import 'package:flutter_kira/util/mColors.dart';

class KImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit boxFit;
  final double width;
  final double height;
  final String placeholder;
  final double placeholderW;
  final double placeholderH;
  final String errorWidget;

  KImage(this.imageUrl,
      {this.boxFit,
      this.width,
      this.height,
      this.placeholder,
      this.errorWidget,
      this.placeholderW = 40.0,
      this.placeholderH = 40.0});

  @override
  Widget build(BuildContext context) {
    return KBoolWeight(
      kBool: null == imageUrl || "" == imageUrl,
      firstChild: Container(
        color: mColors.c_ffffff,
      ),
      secondChild: CachedNetworkImage(
        height: height,
        width: width,
        useOldImageOnUrlChange: true,
        fit: boxFit,
        imageUrl: imageUrl,
        errorWidget: (context, url, progress) {
          return Image.asset(
            errorWidget??R.assetsImagesImageError,
            fit: boxFit,
            height: height,
            width: width,
            package: "flutter_kira",
          );
        },
        placeholder: placeholder != null
            ? (context, url) {
                return Image.asset(
                  placeholder??R.assetsImagesImageLoading,
                  fit: boxFit,
                  height: placeholderH,
                  width: placeholderW,
                  package: "flutter_kira",
                );
              }
            : null,
      ),
    );
  }
}
