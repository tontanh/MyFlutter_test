import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/colorController.dart';
import 'package:mytestflutter/logins/validatePhone.dart';

class PhoneInutPage extends StatefulWidget {
  @override
  _PhoneInutPageState createState() => _PhoneInutPageState();
}

class _PhoneInutPageState extends State<PhoneInutPage> {
  final getcolor = Get.put(ControllerColor());
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('input phone number',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            textinputPwd(),
            buttonWidget(),
          ],
        ),
      ),
    );
  }

  textinputPwd() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'phone',
            contentPadding:
                EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 5),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: getcolor.controlColor(context))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: getcolor.controlColor(context)),
            )),
        onChanged: (value) {
          setState(() {
            phone.text = value;
          });
        },
      ),
    );
  }

  buttonWidget() {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'ok',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print(phone.text);
           Get.to(PHoneValidate(phone.text),transition: Transition.rightToLeft);
        },
      ),
    );
  }
}
