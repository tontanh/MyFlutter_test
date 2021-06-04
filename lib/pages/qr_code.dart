import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeMainPage extends StatefulWidget {
  @override
  _QRCodeMainPageState createState() => _QRCodeMainPageState();
}

class _QRCodeMainPageState extends State<QRCodeMainPage> {
  final controlText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controlText.text,
                size: 200,
              ),
              textInputQRCode(),
            ],
          ),
        ),
      ),
    );
  }

  textInputQRCode() {
    return TextField(
      controller: controlText,
      decoration: InputDecoration(hintText: 'generate text'),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}
