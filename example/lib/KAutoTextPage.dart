import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_auto_text.dart';
import 'package:flutter_kira/kira_container.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/util/mColors.dart';

class KAutoTextPage extends StatelessWidget {
  KTextController kTextController = KTextController()..addCompleted((){
    print('---kira🍎🍎---end');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          "KAutoText",
          color: mColors.c_ffffff,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KAutoText(
              "大家好我是KAutoText大家好我是KAutoText大家好我是KAutoText",
              duration: Duration(milliseconds: 2000),
              kTextController: kTextController,
            ),
            KContainer(
                color: mColors.c_1B88EE,
                padding: 10,
                radius: 5,
                onClick: () {
                  kTextController.start();
                },
                child: KText(
                  "start",
                  color: mColors.c_ffffff,
                )),
          ],
        ),
      ),
    );
  }
}
