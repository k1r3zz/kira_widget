import 'package:flutter/material.dart';

class KCardWidget extends StatefulWidget {
  final String leftIcon;
  final String rightIcon;
  final String title;
  final Widget container;
  final double titleSize;
  final Color titleColor;
  final Color bgColor;
  final bool initiallyExpanded; // 展开收起状态：默认收起
  KCardWidget({
    this.leftIcon,
    this.rightIcon = "assets/images/arrow_left.png",
    this.title,
    this.container,
    this.initiallyExpanded = false,
    this.titleSize = 15,
    this.titleColor,
    this.bgColor,
  });
  @override
  _KCardWidgetState createState() => _KCardWidgetState();
}

class _KCardWidgetState extends State<KCardWidget>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  bool isExpand = true;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    animation = new Tween(begin: 0.0, end: 0.25).animate(animationController);
  }

  _changeTrailing(bool expand) {
    setState(() {
      if (expand) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: widget.bgColor ?? Color(0xffFFFFFF),
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: ExpansionTile(
        initiallyExpanded: widget.initiallyExpanded,
        title: Row(
          children: <Widget>[
            widget.leftIcon == null
                ? Container()
                : Image(
                    image: AssetImage(widget.leftIcon),
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                  ),
            Container(
              width: 10,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: widget.titleSize,
                  color: widget.titleColor ?? Color(0xff000000)),
            ),
          ],
        ),
        trailing: RotationTransition(
          turns: animation,
          child: widget.rightIcon == null
              ? Container()
              : Image(
                  image: AssetImage(widget.rightIcon),
                  height: 16,
                  width: 16,
                  fit: BoxFit.cover,
                ),
        ),
        onExpansionChanged: (expand) {
          isExpand = expand;
          _changeTrailing(expand);
        },
        children: <Widget>[widget.container],
      ),
    );
  }
}
