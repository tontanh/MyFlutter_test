import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mytestflutter/logins/mainPage.dart';
import 'package:mytestflutter/pages/homepage.dart';
import 'package:mytestflutter/pages/loading_page.dart';
import 'package:mytestflutter/provider/test_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
         
  runApp( 
    MyApp());
         
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //String name, pass;
  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TestProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LagoTech',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'NotoSansLao'

            // visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
        // home: HomePage(),
        home: LoginPage(),
      ),
    );
  }
  //   getData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //   name = prefs.getString('name');
  //   pass = prefs.getString('pass');
  //   });
  // }
}
