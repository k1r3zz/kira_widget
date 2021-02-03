import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kira/util/mColors.dart';

Widget KImage(String imageUrl,
    {String errorWidget = "assets/images/image_fault.png",
    fit: BoxFit.cover,
    double width,
    double height,
    String placeholder = "assets/images/image_loading_fill.png",
    double placeholderW = 40,
    double placeholderH = 40}) {
  return null != imageUrl
      ? CachedNetworkImage(
          height: height,
          width: width,
          useOldImageOnUrlChange: true,
          fit: fit,
          imageUrl: imageUrl,
          errorWidget: (context, url, progress) {
            return Image.asset(errorWidget,
                fit: fit, height: height, width: width);
          },
          placeholder: placeholder != null
              ? (context, url) {
                  return Image.asset(placeholder,
                      fit: fit, height: placeholderH, width: placeholderW);
                }
              : null,
        )
      : Container(
          color: mColors.c_ffffff,
        );
}
