# flutter_kira

common widget for project

封装啦一些常用的widget 如：[KContainer](#kcontainer),[KText](#ktext)等，讲一些常用的属性封装出来，快速使用，根据使用情况可以与原生的widget搭配使用

还有一些项目中用到的动画效果做啦下封装，会不断更新,如[KCoverWidget](#kcoverwidget), [KCContainer](#kccontainer) 等

[![Pub](https://img.shields.io/pub/v/flutter_kira.svg)](https://pub.dev/packages/flutter_kira)

## All Widget

- [KContainer](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_container.dart)
- [KText](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_text.dart)
- [KAutoText](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_auto_text.dart)
- [KBoolWeight](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_bool_widget.dart)
- [KCContainer](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_circle_container.dart)
- [KFlowButton](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_flow_button.dart)
- [KWidgetRun](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_widget_run.dart)
- [KCoverWidget](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_cover_widget.dart)
- [KImage](https://github.com/k1r3zz/kira_widget/blob/master/lib/kira_image.dart)
- [KDialog](https://github.com/k1r3zz/kira_widget/blob/master/lib/util/dialog_util.dart)
- [KScreen](https://github.com/k1r3zz/kira_widget/blob/master/lib/util/kira_screen.dart)

## Example Widget

<!--This project is a starting point for a Dart-->
<!--[package](https://flutter.dev/developing-packages/),-->
<!--a library module containing code that can be shared easily across-->
<!--multiple Flutter or Dart projects.-->

<!--For help getting started with Flutter, view our-->
<!--[online documentation](https://flutter.dev/docs), which offers tutorials,-->
<!--samples, guidance on mobile development, and a full API reference.-->

<!--![image](https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1428496956,1019754294&fm=26&gp=0.jpg)-->
<!--![images](./screenshots/coverwidget.gif)-->
<!--<img src="./screenshots/coverwidget.gif" height="300" />-->
<!--<img src="./screenshots/coverwidget.gif" height="300" />-->


| <img src="./screenshots/coverwidget.gif" width="300" /> | <img src="./screenshots/KCoverWidget.gif" width="300" /> |
|:--------------------------------------------------------|:---------------------------------------------------------|
| [KCoverWidget](#kcoverwidget)                           | [KCContainer](#kccontainer)                              |
| <img src="./screenshots/KFlowButton.gif" width="300" /> | <img src="./screenshots/KWidgetRun.gif" width="300" />   |
| [KFlowButton](#kflowbutton)                            | [KWidgetRun](#kwidgetrun)                                |

### KContainer
_Example
```
KContainer(
                  leftMargin: 10,
                  rightMargin: 10,
                  width: double.infinity,
                  radius: 10,
                  padding: 20,
                  height: 335,
                  background: AssetImage(R.imagesIconResultQusetionBg),
                  child: KText(
                    resultData?.result?.totalLuck ?? "",
                    color: mColors.c_FF444444,
                  ),
                ),
```

### KText
_Example
```
  children: [
                    KText(
                      "KText",
                      size: 24,
                      color: mColors.c_FF666666,
                      maxline: 1,
                      fontWeight: FontWeight.bold,
                      fontlist: [24, 22, 20, 18, 16],
                    ),
```


### KCoverWidget
_Example
```
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
```

### KCContainer
_Example
```
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
      
```

### KFlowButton
_Example
```
KFlowButton(
                  width: 250,
                  height: 50,
                  duration: Duration(milliseconds: 300),
                  flowType: FlowType.horizontal,
                  child: ClipOval(
                    child: KContainer(
                      width: 50,
                      height: 50,
                      color: mColors.c_1B88EE,
                      child: Image.asset(R.assetsImagesP1),
                    ),
                  ),
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
                )  
```

### KWidgetRun
_Example
```
KWidgetRun(
              direction: Direction.horizontal,
              child: Image.asset(
                R.assetsImagesP3,
                width: 150,
                height: 150,
              ),
            ),
      
```

## Thank you
If you have any problems, please feel free to contact me: a1215152135@gmail.com
