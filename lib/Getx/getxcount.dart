import 'package:get/get.dart';
import 'package:mytestflutter/Getx/test_getx.dart';

class ControlerCount extends GetxController{
  var num =0.obs;
  void increase(){
   var numsum = num+1;
   update();
  }
}