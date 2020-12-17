import 'dart:ui';

import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*Show toast*/
ShowToast(String message, Color textcolor, Color bgColor) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: bgColor,
      textColor: textcolor,
      fontSize: 16.0);
}

Future<bool> GetInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
