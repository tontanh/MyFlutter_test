import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/data_retrive.dart';

class ScreenBarcode extends StatefulWidget {
  @override
  _ScreenBarcodeState createState() => _ScreenBarcodeState();
}

class _ScreenBarcodeState extends State<ScreenBarcode> {
   final barcodeController = Get.put(BarcodeText());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode'),
        centerTitle: true,
      ),
      body: Center(child: Text('${barcodeController.barcode}',style: TextStyle(fontSize: 24),),),
    );
  }
}
