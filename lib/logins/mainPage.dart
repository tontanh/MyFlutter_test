import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/colorController.dart';
import 'package:mytestflutter/logins/pageConfirmPhone.dart';
import 'package:mytestflutter/logins/register.dart';
import 'package:mytestflutter/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final getcolor = Get.put(ControllerColor());

  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              showTxt(context),
              SizedBox(height: 10),
              buttonWidget(context),
              buttonWidgetre(context),
              buttonWidgetGETAPI(context),
            ],
          ),
        )),
      ),
    );
  }

  showTxt(context) {
    return Container(
      child: Text(
        'List Of TEST',
        style: TextStyle(
            color: getcolor.controlColor(context),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  buttonWidget(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'Phone Firebase',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(PhoneInutPage(), transition: Transition.rightToLeft);
        },
      ),
    );
  }

  buttonWidgetre(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'API Params Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(RegisterPage(), transition: Transition.rightToLeft);
        },
      ),
    );
  }
  buttonWidgetGETAPI(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'GET API ALL',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(HomePage('HomePage'), transition: Transition.rightToLeft);
        },
      ),
    );
  }
}
