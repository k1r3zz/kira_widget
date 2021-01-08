import 'dart:ui';

import 'package:flutter/material.dart';

///屏幕宽度
double screenWidth = MediaQueryData.fromWindow(window).size.width;

///屏幕高度
double screenHeight = MediaQueryData.fromWindow(window).size.height;

///状态栏高度
double statusHeight = MediaQueryData.fromWindow(window).padding.top;

///导航栏高度
const double appBarHeight=kMinInteractiveDimension;
