import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/class/test_class.dart';
import 'package:mytestflutter/provider/test_provider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
             
            
            ],
          ),
        )),
      ),
    );
  }

  testClass() {
    return Text(
      'class == ${ClassName().showName()}',
      style: TextStyle(color: Colors.blue, fontSize: 30),
    );
  }

  testProvid() {
    return Consumer<TestProvider>(
        builder: (context, value, _) =>Column(children: [
               Text('provider == ${value.providerGet}',
            style: TextStyle(color: Colors.blue, fontSize: 30)),
            TextButton(
      onPressed: () {
       setState(() {
          value.providerGet = 'change provider';
       });
      },
      child: Text(
        'change',
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.blue),
    )

        ],));
  }

  testgetx() {
    return Text(
      'getx == ton',
      style: TextStyle(color: Colors.blue, fontSize: 30),
    );
  }
}

