import 'package:flutter/material.dart';

///add judge to choose use firstChild or secondChild default Container()
class KBoolWeight extends StatelessWidget {
  KBoolWeight({
    this.kBool,
    this.firstChild,
    this.secondChild,
    Key key,
  })  : assert(kBool != null),
        assert(firstChild != null),
        super(key: key);

  ///if [kBool] true use firstChild
  final Widget firstChild;

  ///if [kBool] false use secondChild default Container()
  final Widget secondChild;

  ///Judge conditions
  final bool kBool;

  @override
  Widget build(BuildContext context) {
    return kBool ? firstChild : secondChild ?? Container();
  }
}
