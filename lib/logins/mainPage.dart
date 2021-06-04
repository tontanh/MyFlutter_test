import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/colorController.dart';
import 'package:mytestflutter/logins/pageConfirmPhone.dart';
import 'package:mytestflutter/logins/login_api.dart';
import 'package:mytestflutter/pages/api_1_2.dart';
import 'package:mytestflutter/pages/homepage.dart';
import 'package:mytestflutter/pages/phone_auth.dart';
import 'package:mytestflutter/pages/picturePHPbinary.dart';
import 'package:mytestflutter/pages/picturePhp.dart';
import 'package:mytestflutter/pages/qr_code.dart';
import 'package:mytestflutter/pages/scan_qr_code.dart';
import 'package:mytestflutter/test/test_control.dart';
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
              buttonWidgetLoginPhone(context),
              buttonWidgetControl(context),
              buttonWidget(context),
              buttonWidgetre(context),
              buttonWidgetGETAPI(context),
              buttonWidgetAPI_1_2(context),
              buttonWidgetPicture(context),
              buttonWidgetQRCode(context),
              buttonWidgetScanQRCode(context),
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
    buttonWidgetLoginPhone(context) {
    return Container(
      color: Colors.red,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.red),
        child: Text(
          'Phone auth server',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(()=>PhoneAuthScreen(), transition: Transition.rightToLeft);
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
          'API return data',
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
     buttonWidgetControl(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'state manager',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(()=>TestPage(), transition: Transition.rightToLeft);
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
    buttonWidgetQRCode(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'Generate QR Code',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(()=>QRCodeMainPage(), transition: Transition.rightToLeft);
        },
      ),
    );
  }
      buttonWidgetScanQRCode(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'scan QR Code',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Get.to(()=>QRViewExample(), transition: Transition.rightToLeft);
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
