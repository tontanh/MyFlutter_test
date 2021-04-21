import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/colorController.dart';
import 'package:mytestflutter/logins/register.dart';

class LoginPage extends StatelessWidget {
  final getcolor = Get.put(ControllerColor());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              showTxt(context),
              textinput(context: context,hinttext: 'telephone'),
              SizedBox(height: 10),
              textinput(context: context,hinttext: 'password'),
              SizedBox(height: 10),
              buttonWidget(context),
              SizedBox(height: 10),
              regiterWiget(context),
            ],
          ),
        )),
      ),
    );
  }

  showTxt(context) {
    return Container(
      child: Text(
        'Login',
        style: TextStyle(
            color: getcolor.controlColor(context),
            fontSize: 30,
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
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  textinput({context,String hinttext}) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hinttext,
          contentPadding:
              EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 5),
          border: OutlineInputBorder(
          ),
          enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: getcolor.controlColor(context))),
            focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: getcolor.controlColor(context)),
            )),
        ),
    );
  }

  regiterWiget(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('dont have | '),
          InkWell(
            child: Text(
              'register',
              style: TextStyle(color: getcolor.controlColor(context)),
            ),
            onTap: () {
            Get.to(RegisterPage(),transition: Transition.rightToLeft);
            },
          ),
        ],
      ),
    );
  }
}
