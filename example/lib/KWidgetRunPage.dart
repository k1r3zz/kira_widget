import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_container.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/kira_widget_run.dart';
import 'package:flutter_kira/util/mColors.dart';

import 'r.dart';

class KWidgetRunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          "KWidgetRunPage",
          color: mColors.c_ffffff,
        ),
        centerTitle: true,
      ),
      body: KContainer(
        color: mColors.c_ffffff,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KWidgetRun(
              direction: Direction.horizontal,
              child: Image.asset(
                R.assetsImagesP3,
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            KWidgetRun(
              direction: Direction.vertical,
              duration: Duration(milliseconds: 500),
              child: Image.asset(
                R.assetsImagesP3,
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
