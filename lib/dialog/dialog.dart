

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Showdialogs {
  Showdialogs();
  showSucess(context,String text) {
    return showDialog(
      // barrierDismissible: false,
      // barrierColor: null,
      context: context,
      builder: (context) => Container(
        child: AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          content: Container(
            // color: Colors.white,
            height: 80,
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(height: 10),
                Text(text,
                    style: TextStyle(color: Colors.blue, fontSize: 12))
              ],
            ),
          ),
        ),
      ),
    );
  }
}