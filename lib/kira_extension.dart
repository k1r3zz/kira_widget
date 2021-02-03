extension StringExt on String {
  double toDouble() {
    return double.parse(this);
  }

  int toInt() {
    return int.parse(this);
  }

  /// 获取小于该数值的所有整数的一个数值数组
  List<int> toIntList() {
    int number = int.parse(this);
    int changeNum = number;
    List<int> numList;
    while ((changeNum >= 0) & (changeNum <= number)) {
      numList.add(changeNum);
      changeNum--;
    }
    return numList;
  }

  /// 超过1000的number转换成K为单位，小于1000返回原值
  /// several：保留小数点后几位(默认保留1位--因为包含小数点，所以实际位数小数点后一位应该传2)
  String numFormateThousand({int several = 2}) {
    String formateNum;
    int number = int.parse(this);
    if (number < 1000) {
      formateNum = number.toString();
    } else {
      double changeNum = number / 100; // 转换成K以后的数据
      double newChangeNum = changeNum.roundToDouble() / 10.0; // 转换后的数据4舍5入
      formateNum = newChangeNum.toString() + "k";
    }
    return formateNum;
  }

  /// 去除小数点后多余的0
  String toRemoveExtraZero() {
    // 包含小数点，数据处理
    if (this.contains(".")) {
      List<String> stringList = this.split(".");

      /// 小数点后面的数值全部为0
      if (double.parse(stringList.last) == 0) {
        return stringList.first;
      } else {
        var pointString = stringList.last;
        for (var i = 0; i < stringList.last.length; i++) {
          if (pointString.substring(
                  pointString.length - 1, pointString.length) ==
              "0") {
            pointString = pointString.substring(0, pointString.length - 1);
          }
        }
        return stringList.first + "." + pointString;
      }
    } else {
      // 不包含直接返回
      return this;
    }
  }
}
