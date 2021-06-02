import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureBinary extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PictureBinary> {
  // Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String error = 'Error';
  File _image;
  final picker = ImagePicker();



  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  uploadImg() {
    upload();
  }

  upload() async {
    var url = Uri.parse(
        'http://lagotech.la/sorkao/app-upload-picture/student/save-upload-pic.php');
    var response = await http.post(url, body: {
      'st_id': '1',
      'u_id': '1',
      'img': base64Image,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : error);
    }).catchError((error) {
      setStatus(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image/Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<File>(
              future: getImage(),
              builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    null != snapshot.data) {
                  tmpFile = snapshot.data;
                  base64Image = base64Encode(snapshot.data.readAsBytesSync());
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Image.file(
                        snapshot.data,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                } else if (null != snapshot.error) {
                  return const Text(
                    'Error!',
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            child: Image.asset('assets/placeholder-image.png'),
                          ),
                          InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Icon(
                                Icons.edit,
                                size: 30.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              width: 360.0,
              child: RaisedButton(
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                color: Colors.blue,
                onPressed: () {
                  uploadImg();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
