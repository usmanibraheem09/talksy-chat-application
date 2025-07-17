import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void showToast(String message)  {
    Fluttertoast.showToast(msg: message,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16,
    );
  }

}