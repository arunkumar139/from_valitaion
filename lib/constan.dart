import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showlogerror(String msg){
  print(msg);
}

toast(String text){
  /* Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    ); */

    Fluttertoast.showToast(
      msg: text,
      toastLength:Toast.LENGTH_SHORT,
      gravity:ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      
      );
}