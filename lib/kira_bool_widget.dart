import 'package:flutter/material.dart';

class KBoolWeight extends StatelessWidget {
  KBoolWeight({
    this.kBool,
    this.firstChild,
    this.secondChild,
    Key key,
  })  : assert(kBool != null),
        assert(firstChild != null),
        super(key: key);

  Widget firstChild;
  Widget secondChild;
  bool kBool;

  @override
  Widget build(BuildContext context) {
    return kBool ? firstChild : kBool ?? Container();
  }
}
