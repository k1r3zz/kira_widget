import 'dart:ui';

import 'package:flutter/material.dart';

///屏幕宽度
class KScreen {
  static double screenWidth = MediaQueryData.fromWindow(window).size.width;

  ///屏幕高度
  static double screenHeight = MediaQueryData.fromWindow(window).size.height;

  ///状态栏高度
  static double statusHeight = MediaQueryData.fromWindow(window).padding.top;

  ///导航栏高度
  static double appBarHeight = kMinInteractiveDimension;
}
