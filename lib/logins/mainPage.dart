import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/colorController.dart';
import 'package:mytestflutter/logins/pageConfirmPhone.dart';
import 'package:mytestflutter/logins/login_api.dart';
import 'package:mytestflutter/pages/api_1_2.dart';
import 'package:mytestflutter/pages/homepage.dart';
import 'package:mytestflutter/pages/picturePHPbinary.dart';
import 'package:mytestflutter/pages/picturePhp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final getcolor = Get.put(ControllerColor());
  String names, passs;
  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    getData();
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
              buttonWidgetAPI_1_2(context),
              buttonWidgetPicture(context),
              // buttonWidgetPictureBinary(context),
            ],
          ),
        )),
      ),
    );
  }

  showTxt(context) {
    return Container(
      child: Text(
        'List Of TEST $names $passs',
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
    buttonWidgetAPI_1_2(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'API 1=2',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(API_1_2_home(), transition: Transition.rightToLeft);
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
          Get.to(()=>UploadImageDemo(), transition: Transition.rightToLeft);
        },
      ),
    );
  }
  buttonWidgetPicture(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'Upload image Using PHP',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(()=>UploadImageDemo(), transition: Transition.rightToLeft);
        },
      ),
    );
  }
    buttonWidgetPictureBinary(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'Upload image Using PHP Binary',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(()=>PictureBinary(), transition: Transition.rightToLeft);
        },
      ),
    );
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      names = prefs.getString('name');
      passs = prefs.getString('pass');
    });
  }
}
