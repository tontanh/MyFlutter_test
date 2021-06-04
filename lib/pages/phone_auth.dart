import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytestflutter/dialog/dialog.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController numbers = TextEditingController();
  TextEditingController opt = TextEditingController();
  bool showOpt = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    numbers.text = value;
                  },
                  decoration: InputDecoration(hintText: '20xxxxxxxx'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              showOpt == true
                  ? Container(
                      width: 200,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          opt.text = value;
                        },
                        decoration: InputDecoration(hintText: 'code'),
                      ),
                    )
                  : Container(),
              TextButton(
                  onPressed: () {
                    fetchPhoneLogin();
                    // if (showOpt == false) {
                    //   setState(() {
                    //     showOpt = true;
                    //   });
                    //   fetchPhoneLogin();
                    // } else {
                    //   fetchAuthCode();
                    // }
                  },
                  child: showOpt == false
                      ? Text('send number')
                      : Text('send code')),
            ],
          ),
        ),
      ),
    );
  }

  fetchPhoneLogin() async {
    //  await getData();
    
    final url = Uri.http('13.212.244.114:8000', '/login?phonenumber=8562076678862&channel=sms');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Showdialogs().showSucess(context, 'send done');
    } else {
      Showdialogs().showSucess(context, 'send error');
    }
  }

  fetchAuthCode() async {
    //  await getData();
    final String url = "http://13.212.244.114:8000/verify";
    Map<String, String> qParams = {
      'phonenumber': '856${numbers.text}',
      'code': opt.text,
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
      Showdialogs().showSucess(context, 'code complete');
    } else {
       Showdialogs().showSucess(context, 'code error');
    }
  }
}
