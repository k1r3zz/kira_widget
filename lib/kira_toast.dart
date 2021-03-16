import 'package:fluttertoast/fluttertoast.dart';

class KToast {
  static var canShow = true;
  static var oldMsg = '';

  static show(
    String msg, {
    Toast? toastLength,
    int timeInSecForIos = 1,
    double fontSize = 16.0,
    ToastGravity gravity: ToastGravity.CENTER,
    duration = 1,
  }) {
    if (!canShow && oldMsg == msg || !msg.isNotEmpty) return;
    canShow = false;
    oldMsg = msg;
    Fluttertoast.showToast(
            msg: msg, gravity: ToastGravity.CENTER, timeInSecForIosWeb: duration)
        .then((e) {
      Future.delayed(Duration(seconds: duration), () {
        canShow = true;
      });
    });
  }
}
