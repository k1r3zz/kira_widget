import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_bool_widget.dart';
import 'package:flutter_kira/r.dart';

///network image widget use CachedNetworkImage
class KImage extends StatelessWidget {
  KImage(this.imageUrl,
      {this.boxFit,
      this.width,
      this.height,
      this.placeholder,
      this.errorWidget,
      this.placeholderW = 40.0,
      this.placeholderH = 40.0,
      Key? key})
      : super(key: key);

  ///image url
  final String imageUrl;

  ///image BoxFit same as Image
  final BoxFit? boxFit;

  ///image width
  final double? width;

  ///image height
  final double? height;

  ///image loading pic for asset
  final String? placeholder;

  ///image loading width
  final double placeholderW;

  ///image loading height
  final double placeholderH;

  ///image error pic for asset
  final String? errorWidget;

  @override
  Widget build(BuildContext context) {
    return KBoolWeight(
      kBool: null == imageUrl || "" == imageUrl,
      firstChild: buildErrorImage(),
      secondChild: CachedNetworkImage(
          height: height,
          width: width,
          useOldImageOnUrlChange: true,
          fit: boxFit,
          imageUrl: imageUrl,
          errorWidget: (context, url, progress) {
            return buildErrorImage();
          },
          placeholder: (context, url) {
            return Image.asset(
              placeholder ?? R.assetsImagesImageLoading,
              fit: boxFit,
              height: placeholderH,
              width: placeholderW,
              package: "flutter_kira",
            );
          }),
    );
  }

  ///errorImage
  Image buildErrorImage() {
    return Image.asset(
      errorWidget ?? R.assetsImagesImageError,
      fit: boxFit,
      height: height,
      width: width,
      package: "flutter_kira",
    );
  }
}
