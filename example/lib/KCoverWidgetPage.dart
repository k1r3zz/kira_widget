import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_cover_widget.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/util/mColors.dart';

class KCoverWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          "KCoverWidgetPage",
          color: mColors.c_ffffff,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: mColors.c_ffffff,
        child: Column(
          children: [
            KCoverWidget(
              overHeight: 90,
              downStr: "点击更多详情",
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget大家好我是KCoverWidget",
                    // overflow: TextOverflow.visible,
                  ),
                  // Container(height: 120,color: mColors.c_333333,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
