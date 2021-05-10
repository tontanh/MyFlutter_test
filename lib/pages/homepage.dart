import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytestflutter/class/services.dart';
import 'package:mytestflutter/models/testclass_api.dart';

class HomePage extends StatefulWidget {
  var uid;
  HomePage(this.uid);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(uid == null ? 'no uid' : uid),
      ),
      body: Container(
          child: FutureBuilder(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                TestModelApi usersClass = snapshot.data[index];
                return Card(
                  child: ListTile(
                    subtitle: Column(
                      children: [
                        Text(usersClass.id),
                        Text(usersClass.name),
                        Text(usersClass.address),
                        Text(usersClass.email),
                        Text(usersClass.password),
                        Text(usersClass.created.toString()),
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
}
