import 'package:flutter/material.dart';
import 'package:flutter_kira/kira_container.dart';
import 'package:flutter_kira/kira_dialog.dart';
import 'package:flutter_kira/kira_flow_button.dart';
import 'package:flutter_kira/kira_text.dart';
import 'package:flutter_kira/util/mColors.dart';

import 'KAutoTextPage.dart';
import 'KCoverWidgetPage.dart';
import 'KWidgetRunPage.dart';
import 'kCContainerPage.dart';
import 'r.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          "kirademo",
          color: mColors.c_ffffff,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            KContainer(
              width: double.infinity,
              height: double.infinity,
              color: mColors.c_f9f9f9,
              padding: 20,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        KContainer(
                          width: 200,
                          height: 200,
                          radius: 4,
                          color: mColors.c_1B88EE,
                          background: AssetImage(R.assetsImagesP2),
                          alignment: Alignment.center,
                          onClick: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KWidgetRunPage()));
                          },
                          child: KText(
                            "KWidgetRun",
                            fontWeight: FontWeight.bold,
                            color: mColors.c_444444,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: KContainer(
                            height: 200,
                            radius: 4,
                            alignment: Alignment.center,
                            background: NetworkImage(
                                "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3474492197,1737272281&fm=26&gp=0.jpg"),
                            onClick: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => KAutoTextPage()));
                            },
                            child: KText(
                              "KAutoText",
                              fontWeight: FontWeight.bold,
                              color: mColors.c_ffffff,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    KContainer(
                      width: double.infinity,
                      height: 50,
                      radius: 4,
                      alignment: Alignment.center,
                      color: mColors.c_1BB1E6,
                      onClick: () {
                        KDialog.showDialog(context, "我是一个KDialog", "确认", () {
                          print('---kira🍎🍎---我是一个KDialog');
                        });
                      },
                      child: KText(
                        "KDialog",
                        fontWeight: FontWeight.bold,
                        color: mColors.c_ffffff,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    KContainer(
                      width: double.infinity,
                      height: 200,
                      radius: 4,
                      alignment: Alignment.center,
                      background: AssetImage(R.assetsImagesP4),
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => KCContainerPage()));
                      },
                      child: KText(
                        "kCContainer",
                        fontWeight: FontWeight.bold,
                        color: mColors.c_444444,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    KContainer(
                      width: double.infinity,
                      height: 200,
                      radius: 4,
                      alignment: Alignment.center,
                      background: NetworkImage(
                          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1428496956,1019754294&fm=26&gp=0.jpg"),
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => KCoverWidgetPage()));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => Kdemo()));
                      },
                      child: KText(
                        "KCoverWidget",
                        fontWeight: FontWeight.bold,
                        color: mColors.c_ffffff,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: 250,
                height: 50,
                child: KFlowButton(
                  width: 250,
                  height: 50,
                  duration: Duration(milliseconds: 300),
                  child: ClipOval(
                    child: KContainer(
                      width: 50,
                      height: 50,
                      color: mColors.c_1B88EE,
                      child: Image.asset(R.assetsImagesP1),
                    ),
                  ),
                  flowType: FlowType.horizontal,
                  widgets: [
                    ClipOval(
                      child: KContainer(
                        width: 50,
                        height: 50,
                        color: mColors.c_1B88EE,
                        alignment: Alignment.center,
                        child: KText(
                          "1",
                          color: mColors.c_ffffff,
                        ),
                      ),
                    ),
                    ClipOval(
                      child: KContainer(
                        width: 50,
                        height: 50,
                        color: mColors.c_1B88EE,
                        alignment: Alignment.center,
                        child: KText(
                          "2",
                          color: mColors.c_ffffff,
                        ),
                      ),
                    ),
                    ClipOval(
                      child: KContainer(
                        width: 50,
                        height: 50,
                        color: mColors.c_1B88EE,
                        alignment: Alignment.center,
                        child: KText(
                          "3",
                          color: mColors.c_ffffff,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
