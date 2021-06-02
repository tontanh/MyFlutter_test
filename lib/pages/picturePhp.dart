import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageDemo extends StatefulWidget {
  UploadImageDemo() : super();
  final String title = "Upload Image Demo";
  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}

class UploadImageDemoState extends State<UploadImageDemo> {
  File _imageFile;
  Future<File> file;
  File _imagePic;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  final _picker = ImagePicker();

  chooseImage() async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        this._imageFile = File(pickedFile.path);
        //  startUpload();
        tmpFile = this._imageFile;
        // file = this._imageFile.path
      } else {
        print('No Image');
      }
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }
  Future upLoadDioImage({String filename}) async {
    // String url ="http://lagotech.la/sorkao/app-upload-picture/student/save-upload-pic.php?st_id=1&u_id=1&img=";
     String url ="http://lagotech.la/sorkao/app-upload-picture/student/save-upload-pic.php";
  try {
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromFile(filename,
          filename: filename.split("/").last,
          contentType: MediaType('img', 'jpg',)),
    });

    Response response = await Dio().post("$url", data: formData);
     setStatus('done.........');
    Map responseBody = response.data;
    return responseBody;
  } catch (e) {}
}

//  uploadImage()async{
   
//         var formData = FormData();
//         formData.files.add(MapEntry("Picture", await MultipartFile.fromFile(data.foto.path, filename: "pic-name.png"), ));
//         var response = await Dio().post('v1/post', data: formdata);
//     }

  startUpload() {
    setStatus('Uploading Image...');
   print(_imageFile.path);
 
  //  setState(() {
  //     base64Image = base64Encode(_imageFile.readAsBytesSync());
  //     print(base64Image);
  //  });
  // _imagePic = File(_imageFile.path);
    // upload();
    upLoadDioImage(filename:_imageFile.path);
  }
  upload() async {
      setStatus('Uploading Image11111...');
      // final bytes = _images.readAsBytesSync();
    //  await getData();
    // final String url =
    //     // "http://lagotech.la/sorkao/app-upload-picture/student/save-upload-pic.php";
    //     "http://lagotech.la/sorkao/app-upload-picture/student/save-upload-pic.php";
    // Map<String, String> qParams = {
    //   'st_id': '1',
    //   'u_id': '1',
    //   'img':  base64Encode(_imageFile.readAsBytesSync()),
    // };
    // Map<String, String> header = {
    //   HttpHeaders.contentTypeHeader: "application/json"
    // };
    // Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams); //USE THIS
    // final response = await http.post(
    //   finalUri,
    //   headers: header,
    // );
    // if (response.statusCode == 200) {
    //   setStatus('Upload done!');
    //   print(response.body);
    // } 
    // else {
    //   print(response.statusCode);
    //    setStatus('Uploading Image...errorrrrrrrrrrrrr');
    //   throw Exception("Failed to load data");
    // }

  var url = Uri.parse(
        'http://lagotech.la/sorkao/app-upload-picture/student/save-upload-pic.php?st_id=1&u_id=1&');
    var response = await http.post(url, body: {
      'img': base64Encode(_imageFile.readAsBytesSync()),
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }

  Widget showImage() {
    if (_imageFile != null) {
      return Flexible(
        child: Image.file(
          _imageFile,
          fit: BoxFit.fill,
        ),
      );
    } else {
      return const Text(
        'No Image Selected',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlineButton(
              onPressed: chooseImage,
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: startUpload,
              child: Text('Upload Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
