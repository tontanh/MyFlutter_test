import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mytestflutter/class/class_students.dart';
import 'package:mytestflutter/class/services.dart';
import 'package:mytestflutter/logins/mainPage.dart';
import 'package:mytestflutter/models/model_students.dart';
import 'package:mytestflutter/models/testclass_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class API_1_2_home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<API_1_2_home> {
  // StudentInfo _std;
  String uid;
  // var _controller;
  @override
  void initState() {
    fetchStudentInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(uid == null ? 'no uid' : uid),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {},
          )
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchStudentInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  StudentInfo _std = snapshot.data[index];
                  if (_std.dob == null) {
                    _std.dob ="";
                  }
                  return Card(
                    child: ListTile(
                      subtitle: Column(
                        children: [
                          Text(_std.lname),
                          Text(_std.fname),
                          Text(_std.dob),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  // Future getDatas() async {
  //   final StudentInfo user = await fetchStudentInfo();
  //   setState(() {
  //     _std = user;
  //   });
  // }

  Future<List<StudentInfo>> fetchStudentInfo() async {
    var url = Uri.parse(
        'http://lagotech.la/sorkao/app-upload-picture/student/index.php?pro_id=10&dis_id=10&vill_id=1&type_school=5&school_id=3');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return studentInfoFromJson(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
