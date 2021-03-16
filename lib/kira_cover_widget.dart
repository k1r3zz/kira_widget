import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_bool_widget.dart';
import 'package:flutter_kira/kira_container.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/kira_widget_run.dart';
import 'package:flutter_kira/r.dart';
import 'package:flutter_kira/util/mColors.dart';

///cover widget
class KCoverWidget extends StatefulWidget {
  KCoverWidget(
      {Key? key, this.overHeight, this.child, this.downStr, this.duration})
      : assert(overHeight != null && overHeight >= 90),
        super(key: key);

  ///cover part height overHeight must > 90 because widget
  final double? overHeight;

  ///cover child
  final Widget? child;

  ///cover part text
  final String? downStr;

  ///open cover time
  final Duration? duration;

  @override
  _KCoverWidgetState createState() => _KCoverWidgetState();
}

class _KCoverWidgetState extends State<KCoverWidget> {
  final GlobalKey<_KCoverWidgetState> _globalKey = GlobalKey();

  ///need real height
  double? _overHeight;

  ///widget all height
  double? _all;

  ///is first init
  late bool _isfirst;

  ///change opacity
  late bool _cOpacity;

  ///get real height
  void refreshRealHeight() {
    _isfirst = true;
    Future.microtask(() {
      setState(() {
        _all = _globalKey.currentContext!.size!.height;
        _isfirst = false;
      });
      print(
          "-🐯1111------${_globalKey.currentContext!.size!.width}---${_globalKey.currentContext!.size!.height}-");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _cOpacity = true;
    _overHeight = widget.overHeight;

    refreshRealHeight();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant KCoverWidget oldWidget) {
    // TODO: implement didUpdateWidget
    refreshRealHeight();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KBoolWeight(
          kBool: _isfirst,
          firstChild: Container(key: _globalKey, child: childWeight()),
          secondChild: Container(),
        ),
        AnimatedContainer(
          duration: widget.duration ?? Duration(milliseconds: 200),
          width: double.infinity,
          height: _overHeight,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: childWeight(),
              ),
              AnimatedOpacity(
                opacity: _cOpacity ? 1.0 : 0.0,
                duration: widget.duration ?? Duration(milliseconds: 200),
                child: KContainer(
                  onClick: () {
                    setState(() {
                      if (_cOpacity) {
                        _cOpacity = false;
                        _overHeight = _all;
                      } else {
                        _cOpacity = true;
                        _overHeight = widget.overHeight;
                      }
                    });
                  },
                  height: 90,
                  child: Column(
                    children: [
                      KContainer(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x00FFFFFF), Color(0xffFFFFFF)],
                          ),
                          border: Border(
                            bottom:
                                BorderSide(color: mColors.c_ffffff, width: 0.0),
                          ),
                        ),
                      ),
                      KContainer(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: mColors.c_ffffff,
                          border: Border(
                            bottom:
                                BorderSide(color: mColors.c_ffffff, width: 0.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            KBoolWeight(
                              kBool: widget.downStr != null,
                              firstChild: KText(
                                widget.downStr,
                                size: 10,
                                color: mColors.c_5868d9,
                              ),
                            ),
                            KWidgetRun(
                              child: Image.asset(
                                R.assetsImagesIconCoverDown,
                                width: 22,
                                height: 22,
                                package: "flutter_kira",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///展开部分
  Widget childWeight() {
    return Column(
      children: [
        widget.child!,
        KContainer(
          height: 40,
          alignment: Alignment.center,
          child: KWidgetRun(
            child: Image.asset(
              R.assetsImagesIconCoverUp,
              width: 22,
              height: 22,
              package: "flutter_kira",
            ),
          ),
        ),
      ],
    );
  }
}
