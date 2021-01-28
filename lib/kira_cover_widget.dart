import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_bool_widget.dart';
import 'package:flutter_kira/kira_container.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/r.dart';
import 'package:flutter_kira/util/mColors.dart';

import 'kira_widget_run.dart';

class KCoverWidget extends StatefulWidget {
  KCoverWidget({this.overHeight, this.child, this.downStr, this.duration})
      : assert(overHeight != null && overHeight >= 90);

  double overHeight;
  Widget child;
  String downStr;
  Duration duration;

  @override
  _KCoverWidgetState createState() => _KCoverWidgetState();
}

class _KCoverWidgetState extends State<KCoverWidget> {
  final GlobalKey<_KCoverWidgetState> _globalKey = GlobalKey();

  ///需要展示的高度
  double _overHeight;

  ///组件的总高度
  double _all;

  ///是否是第一次加载
  bool _isfirst;

  ///控制变化
  bool _cOpacity;

  @override
  void initState() {
    // TODO: implement initState
    _cOpacity = true;
    _isfirst = true;
    _overHeight = widget.overHeight;

    ///获取需要weight的真实高度
    Future.microtask(() {
      setState(() {
        _all = _globalKey.currentContext.size.height;
        _isfirst = false;
        // _overHeight = 100;
      });
      print(
          "-🐯------${_globalKey.currentContext.size.width}---${_globalKey.currentContext.size.height}-");
    });

    super.initState();
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
                        )),
                      ),
                      KContainer(
                        height: 40,
                        color: mColors.c_ffffff,
                        alignment: Alignment.center,
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
                                "assets/images/icon_cover_down.png",
                                width: 22,
                                height: 22,
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
        widget.child,
        KContainer(
          height: 40,
          color: mColors.c_F29800,
          alignment: Alignment.center,
          child: KWidgetRun(
            child: Image.asset(
              'assets/images/icon_cover_up.png',
              width: 22,
              height: 22,
            ),
          ),
        ),
      ],
    );
  }
}
