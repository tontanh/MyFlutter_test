import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mytestflutter/models/model_students.dart';




//   String url =
//       'http://lagotech.la/sorkao/app-upload-picture/login.php?u_name=lay&pass=1';
//   if (await canLaunch(url)) {
//     await launch(
//       url,
//       forceSafariVC: false,
//       forceWebView: false,
//       headers: <String, String>{'my_header_key': 'my_header_value'},
//     );
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// Future<void> launchGet() async {
//   String url = 'http://lagotech.la/sorkao/app-upload-picture/student/index.php';
//   if (await canLaunch(url)) {
//     await launch(
//       url,
//       forceSafariVC: false,
//       forceWebView: false,
//       headers: <String, String>{'my_header_key': 'my_header_value'},
//     );
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// Future<void> webViewSign() async {
//   var _controller;
//   WebView(
//       initialUrl:
//           'http://lagotech.la/sorkao/app-upload-picture/login.php?u_name=lay&pass=1',
//       onWebViewCreated: (controller) {
//         _controller = controller;
//         print(_controller.currentUrl());
//       });
//       return _controller;
// }
