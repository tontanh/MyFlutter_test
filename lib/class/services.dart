import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mytestflutter/models/testclass_api.dart';

// static const String url = 'https://api.tonserver.cf/public/api/read/';

// class ServicesAPI {
//   static final url = Uri.https('api.tonserver.cf', '/public/api/read/');

//   static Future<List<UsersClass>> listUsers() async {
//     // final url = Uri.https('api.tonserver.cf', '/public/api/read/');

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final List<UsersClass> users =
//             testModelApiFromJson(response.body) as List<UsersClass>;
//         return users;
//       } else {
//         return List<UsersClass>();
//       }
//     } catch (e) {
//       return List<UsersClass>();
//     }
//   }
// }

Future<List<TestModelApi>> fetchUsers() async {
  try {
    final url = Uri.http('api.tonserver.cf', '/public/api/read/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return testModelApiFromJson(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  } catch (e) {}
}
