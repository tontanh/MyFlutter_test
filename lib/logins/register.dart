import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/colorController.dart';
import 'package:http/http.dart' as http;
import 'package:mytestflutter/models/user_teacher.dart';
import 'package:mytestflutter/pages/homepage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserTeacher _user;
  final getcolor = Get.put(ControllerColor());
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController stat = TextEditingController();

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
              textinputname(),
              textinputphone(),
              
              _user == null?Text('Nothiing'):Text("stat == ${_user.state} name == NoShow"),
              SizedBox(height: 10),
              
              buttonWidget(context),
            ],
          ),
        )),
      ),
    );
  }

  Future<UserTeacher> getUserjsonParams({String name ,pass}) async {
    final String url = "http://lagotech.la/sorkao/app-upload-picture/login.php";
    Map<String, String> qParams = {
      'u_name': name,
      'pass': pass,
    };
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    Uri uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: qParams); //USE THIS
    final response = await http.get(
      finalUri,
      headers: header,
    );

    if (response.statusCode == 200) {
      print(response.body);
      // final String responseString = response.body;
      return userTeacherFromJson(response.body);
    } else {
      return null;
    }
  }

  buttonWidget(context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'ok',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          print('name ==' + name.text);
          print('phone ==' + pass.text);
          // getUserjsonParams();
          final UserTeacher user = await getUserjsonParams(name: name.text,pass: pass.text);
          setState(() {
           
            _user =user;
            

          });
          if (_user.state ==1) {
             Get.to(HomePage('HomePage'), transition: Transition.rightToLeft);
          } else {
            Container();
          }
        },
      ),
    );
  }

  showTxt(context) {
    return Container(
      child: Text(
        'Login API',
        style: TextStyle(
            color: getcolor.controlColor(context),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  textinputname() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'name',
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
            name.text = value;
          });
        },
      ),
    );
  }

  textinputphone() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'pwd',
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
            pass.text = value;
          });
        },
      ),
    );
  }
}
