import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/util/dialog_util.dart';
import 'package:flutter_kira/util/mColors.dart';

import 'kira_container.dart';

class KDialog {
  ///common dialog
  static void showDialog(
      BuildContext context, String content, String confirm, Function click,
      {String cancel = "取消", Function? cancelClick}) {
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
                            child: KContainer(
                              leftPadding: 20,
                              rightPadding: 20,
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
                                      if (cancelClick != null) {
                                        cancelClick();
                                      }
                                    },
                                    child: Container(
                                      color: mColors.c_000000000,
                                      alignment: Alignment.center,
                                      child: KText(cancel,
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
                                      Navigator.pop(context);
                                      click();
                                    },
                                    child: Container(
                                      color: mColors.c_000000000,
                                      alignment: Alignment.center,
                                      child: KText(confirm,
                                          color: mColors.c_999999, size: 18),
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
