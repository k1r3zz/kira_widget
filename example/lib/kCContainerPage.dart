import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_circle_container.dart';
import 'package:flutter_kira/kira_container.dart';
import 'package:flutter_kira/kira_dialog.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/util/kira_screen.dart';
import 'package:flutter_kira/util/mColors.dart';

import 'r.dart';

class KCContainerPage extends StatefulWidget {
  @override
  _KCContainerPageState createState() => _KCContainerPageState();
}

class _KCContainerPageState extends State<KCContainerPage> {
  PointController mpointController = PointController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          "KCContainerPage",
          color: mColors.c_ffffff,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: List.generate(5, (index) {
              PointController pointController = PointController();

              return Container(
                child: Stack(
                  children: [
                    KContainer(
                      radius: 5,
                      margin: 10,
                      height: 100,
                      width: double.infinity,
                      onClick: () {
                        //                   pointController.openView();
                        print('---kira🍎🍎---$index');
                      },
                      color: mColors.c_D8D8D8,
                    ),
                    Positioned(
                      right: 20,
                      top: 20,
                      child: ClipOval(
                        child: KContainer(
                          onClick: () {
                            pointController.openView();
                          },
                          color: mColors.c_516DB3,
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text("open"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: KCContainer(
                        height: 100,
                        radius: 5,
                        width: KScreen.screenWidth - 10,
                        pointController: pointController,
                        offset: Offset(KScreen.screenWidth - 65, 45),
                        child: KContainer(
                          radius: 5,
                          color: mColors.c_516DB3,
                          child: Row(
                            children: List.generate(
                              3,
                              (index) => Expanded(
                                child: Center(
                                  child: ClipOval(
                                    child: KContainer(
                                      onClick: () {
                                        KDialog.showDialog(
                                            context, "mine", "ok", () {});
                                      },
                                      color: mColors.c_1B88EE,
                                      width: 50,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: Text("dd"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          KCContainer(
            height: KScreen.realHeight,
            width: KScreen.screenWidth,
            pointController: mpointController,
            offset: Offset(KScreen.screenWidth - 65, KScreen.realHeight - 65),
            child: Container(
              color: mColors.c_516DB3,
              child: Image.asset(R.assetsImagesP4),
            ),
          )
        ],
      ),
      floatingActionButton: ClipOval(
        child: KContainer(
          width: 70,
          height: 70,
          color: mColors.c_4C4F61,
          alignment: Alignment.center,
          onClick: () {
            mpointController.openView();
          },
          child: KText(
            "open",
            color: mColors.c_ffffff,
          ),
        ),
      ),
    );
  }
}
