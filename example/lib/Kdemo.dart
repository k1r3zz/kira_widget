import 'package:flutter/material.dart';
import 'package:flutter_kira/util/kira_screen.dart';
import 'package:flutter_kira/util/mColors.dart';

class Kdemo extends StatefulWidget {
  @override
  _KdemoState createState() => _KdemoState();
}

class _KdemoState extends State<Kdemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('---kira🍎🍎---${KScreen.screenHeight}======${KScreen.realHeight}');
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Column(
        children: [
          // Container(
          //   height: 100,
          //   child: Text("data"),
          // ),

          // Text("data"),
          // Container(height: 100,width: double.infinity,color: mColors.c_516DB3,),

          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: mColors.c_516DB3, width: 0.0)),
                color: mColors.c_516DB3),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0XFF302F4F), width: 0.0)),
                color: mColors.c_516DB3),
          )
        ],
      ),
    );
  }
}
