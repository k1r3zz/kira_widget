import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/util/dialog_util.dart';
import 'package:flutter_kira/util/mColors.dart';

import 'kira_container.dart';

class KDialog {
  static void showDialog(
      BuildContext context, String content, String out, Function click) {
    showElasticDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) {
          return Material(
            type: MaterialType.transparency, //透明类型

            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: mColors.c_000000000,
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: KContainer(
                      height: 178,
                      width: 281,
                      color: mColors.c_ffffff,
                      radius: 10,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Center(
                                child: KText(
                                  content,
                                  color: mColors.c_999999,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            color: mColors.c_F5F5F5,
                          ),
                          Container(
                            height: 60,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      color: mColors.c_000000000,
                                      alignment: Alignment.center,
                                      child: KText("取消",
                                          color: mColors.c_999999, size: 18),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: mColors.c_F5F5F5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      click();
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      color: mColors.c_000000000,
                                      alignment: Alignment.center,
                                      child: KText(out,
                                          color: mColors.c_F54B64, size: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
