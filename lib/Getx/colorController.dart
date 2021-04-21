import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerColor extends GetxController{
Color color;
controlColor (context){
Color colordefult = Theme.of(context).primaryColor; 
return colordefult;
}
}