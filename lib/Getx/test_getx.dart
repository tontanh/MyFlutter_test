import 'dart:collection';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

// you can rest api or arry anthing with get x
class Controller extends GetxController {
  RxString name= 'ton'.obs;

  @override
  void onInit() {
    super.onInit();
    showName();
  }

  void showName() async {
    await Future.delayed(Duration(seconds: 1));
    String showNameVoid = 'getx by ton';
    name.value = showNameVoid;
  }
}
