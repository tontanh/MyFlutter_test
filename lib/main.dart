import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mytestflutter/logins/login.dart';
import 'package:mytestflutter/pages/homepage.dart';
import 'package:mytestflutter/provider/test_provider.dart';
import 'package:mytestflutter/test/test_control.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider(create: (_)=>TestProvider()),
      ],
      child: GetMaterialApp(
        title: 'LagoTech',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'NotoSansLao'
          
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
