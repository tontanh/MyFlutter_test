import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/getxcount.dart';


class Testsumgetx extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<Testsumgetx> {
  // getxput
  final getxgetsum = Get.put(ControlerCount());
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
         setState(() {
            Get.find<ControlerCount>().increase();
         });
        },
        label: Icon(Icons.plus_one),
      ),
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             testGetx(),
            ],
          ),
        )),
      ),
    );
  }
   testGetx() {
    return Text(
      'class == ${getxgetsum.num}',
      style: TextStyle(color: Colors.blue, fontSize: 20),
    );
  }

}