import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/test_getx.dart';
import 'package:mytestflutter/class/test_class.dart';
import 'package:mytestflutter/provider/test_provider.dart';
import 'package:mytestflutter/test/testgetxsum.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // getxput
  final getxname = Get.put(Controller());
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              testClass(),
              testgetx(),
              testProvid(),
              testbutton(),
               testbuttonNext(),
            ],
          ),
        )),
      ),
    );
  }

  // classssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
  testClass() {
    return Text(
      'class == ${ClassName().showName()}',
      style: TextStyle(color: Colors.blue, fontSize: 20),
    );
  }

// providerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
  testProvid() {
    return Consumer<TestProvider>(
        builder: (context, value, _) => Column(
              children: [
                Text('provider == ${value.providerGet}',
                    style: TextStyle(color: Colors.blue, fontSize: 20)),
              ],
            ));
  }

// getxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  testgetx() {
    return GetX<Controller>(
      builder: (_) {
        return Text(
          'getx===${getxname.name}',
          style: TextStyle(color: Colors.blue, fontSize: 20),
        );
      },
    );
  }

// providerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
  testbutton() {
    return Consumer<TestProvider>(
        builder: (context, value, _) => Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      value.providerGet = 'change provider';
                      getxname.name = 'change getx'.obs;
                    });
                  },
                  child: Text(
                    'change',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                )
              ],
            ));
  }


  testbuttonNext() {
    return TextButton(
      onPressed: () {
        Get.to(Testsumgetx(),transition: Transition.cupertino);
      },
      child: Text(
        'next Page',
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.blue),
    );
  }
}
