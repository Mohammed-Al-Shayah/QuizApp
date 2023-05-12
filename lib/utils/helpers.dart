
import 'package:flutter/material.dart';


mixin Helpers{
  // showSnackBar
  void showSnackBar({required BuildContext context,required String message,bool error =false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(

        duration: Duration(milliseconds: 1200),
        content: Text(message),
        // if error the backgroundColor is red else backgroundColor green
        backgroundColor: error?Colors.red:Colors.green,
      ),
    );
  }
}