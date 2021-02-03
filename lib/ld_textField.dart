import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KTextField extends StatelessWidget {
  KTextField(
      {Key key,
      this.leftWidget,
      this.rightWidget,
      this.placeholder,
      this.inputFormatters,
      this.focusNode,
      this.editingController,
      this.borderWidth = 0.5,
      this.fontSize = 16,
      this.borderRadius,
      this.borderRadiusTL,
      this.borderRadiusTR,
      this.borderRadiusBL,
      this.borderRadiusBR,
      this.fontWeight,
      this.titleColor = const Color(0xff000000),
      this.enableInputBorderWidget,
      this.disabledInputBorderWidget,
      this.focusedInputBorderWidget,
      this.keyboardType,
      this.enabledBorder = const Color(0xff000000),
      this.disabledBorderColor,
      this.keyboardAppearance = Brightness.light,
      this.filled = true,
      this.fillColor = const Color(0xffFFFFFF),
      this.contentPadding,
      this.contentPaddL,
      this.contentPaddR,
      this.contentPaddB,
      this.contentPaddT,
      this.focusedBorderColor,
      this.placeholderColor,
      this.callBack})
      : super(key: key);

  TextEditingController editingController;
  Function(String) callBack;
  String placeholder;

  /// 提示文本
  Widget leftWidget;

  /// 左边icon
  Widget rightWidget;

  /// 右边icon
  Color titleColor;

  /// 文本颜色
  Color placeholderColor;

  /// 提示文本颜色
  double fontSize;

  /// 文字大小
  FontWeight fontWeight;

  /// 文本字体宽度
  List<TextInputFormatter> inputFormatters;

  /// 输入文本格式化

  /// 文本边距，默认左边距等于右边距，上边距等于下边距
  double contentPadding;
  double contentPaddT;
  double contentPaddB;
  double contentPaddL;
  double contentPaddR;

  FocusNode focusNode;

  double borderWidth;

  /// 边框宽度
  /// 边框圆角，默认无圆角
  double borderRadius;

  /// 边框圆角
  double borderRadiusTL;

  /// 边框左上圆角
  double borderRadiusTR;

  /// 边框右上圆角
  double borderRadiusBL;

  /// 边框左下圆角
  double borderRadiusBR;

  /// 边框右下圆角

  InputBorder enableInputBorderWidget;
  InputBorder disabledInputBorderWidget;
  InputBorder focusedInputBorderWidget;
  TextInputType keyboardType;
  Color fillColor;

  Color enabledBorder;
  Color disabledBorderColor;
  Brightness keyboardAppearance;

  /// 键盘主体颜色
  bool filled;
  Color focusedBorderColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: editingController,
        onChanged: (value) {
          callBack(value);
        },
        focusNode: focusNode,
        decoration: InputDecoration(
          fillColor: fillColor,
          contentPadding: contentPadding == null
              ? EdgeInsets.only(
                  left: contentPaddL ?? (contentPaddR ?? 0),
                  right: contentPaddR ?? (contentPaddL ?? 0),
                  top: contentPaddT ?? (contentPaddB ?? 0),
                  bottom: contentPaddB ?? (contentPaddT ?? 0),
                )
              : EdgeInsets.all(contentPadding),
          filled: filled,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: fontSize,
              color: placeholderColor ?? titleColor,
              fontWeight: fontWeight ?? FontWeight.normal),
          prefixIcon: leftWidget,
          suffixIcon: rightWidget,
          enabledBorder: enableInputBorderWidget ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: enabledBorder,
                  width: borderWidth,
                ),
                borderRadius: borderRadius == null
                    ? BorderRadius.only(
                        topLeft: borderRadiusTL ?? Radius.zero,
                        topRight: borderRadiusTR ?? Radius.zero,
                        bottomLeft: borderRadiusBL ?? Radius.zero,
                        bottomRight: borderRadiusBR ?? Radius.zero,
                      )
                    : BorderRadius.all(
                        Radius.circular(borderRadius ?? Radius.zero)),
              ),
          disabledBorder: disabledInputBorderWidget ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: disabledBorderColor ?? enabledBorder,
                  width: borderWidth,
                ),
                borderRadius: borderRadius == null
                    ? BorderRadius.only(
                        topLeft: borderRadiusTL ?? Radius.zero,
                        topRight: borderRadiusTR ?? Radius.zero,
                        bottomLeft: borderRadiusBL ?? Radius.zero,
                        bottomRight: borderRadiusBR ?? Radius.zero,
                      )
                    : BorderRadius.all(
                        Radius.circular(borderRadius ?? Radius.zero)),
              ),
          focusedBorder: focusedInputBorderWidget ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusedBorderColor ?? enabledBorder,
                  width: borderWidth,
                ),
                borderRadius: borderRadius == null
                    ? BorderRadius.only(
                        topLeft: borderRadiusTL ?? Radius.zero,
                        topRight: borderRadiusTR ?? Radius.zero,
                        bottomLeft: borderRadiusBL ?? Radius.zero,
                        bottomRight: borderRadiusBR ?? Radius.zero,
                      )
                    : BorderRadius.all(
                        Radius.circular(borderRadius ?? Radius.zero)),
              ),
        ),
        style: TextStyle(
            fontSize: fontSize,
            color: titleColor,
            fontWeight: fontWeight ?? FontWeight.normal),
        keyboardType: keyboardType,
        keyboardAppearance: keyboardAppearance,
        inputFormatters: inputFormatters,
        cursorColor: titleColor);
  }
}
