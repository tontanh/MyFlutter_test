import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mytestflutter/logins/mainPage.dart';
import 'package:mytestflutter/models/user_teacher.dart';
import 'package:mytestflutter/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaodingPage extends StatefulWidget {
  @override
  _LaodingPageState createState() => _LaodingPageState();
}

class _LaodingPageState extends State<LaodingPage> {
  UserTeacher _user;
  String name4, pass4;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('llllllllll231312');
          return null;
        }
        if (snapshot.connectionState == ConnectionState.done) {
          getAPI(name1: name4, pass1: pass4);
        }
        return loadingWiget();
      },
    );
  }

  getAPI({String name1, pass1}) async {
    final UserTeacher user = await getUserjsonParams(name: name1, pass: pass1);
    _user = user;
    print('usdfhdfeh====' + _user.state.toString());

    if (_user.state == 1 && _user.state != null) {
      print('tttttttttttttttttttttttttttttttttt');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage('t')),
      );
    }
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name4 = prefs.getString('name');
    pass4 = prefs.getString('pass');
    // setState(() {});
  }

  Future<UserTeacher> getUserjsonParams({String name, pass}) async {
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
      String ab = '{"state":0,"statusCode":404}';
      if (ab == response.body) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        return userTeacherFromJson(response.body);
      }
      if (response.statusCode == 404) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    }
  }

  loadingWiget() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Loading ...')
          ],
        ),
      ),
    );
  }
}
