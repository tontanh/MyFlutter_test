import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mytestflutter/Getx/test_getx.dart';

class ControlerCount extends GetxController{
  int num= 0;
  void increase(){
   num++;
   update();
  }
}