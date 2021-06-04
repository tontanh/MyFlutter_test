import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/data_retrive.dart';
import 'package:mytestflutter/logins/mainPage.dart';
import 'package:mytestflutter/pages/screen_barcode.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode barcode;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final barcodeController = Get.put(BarcodeText());
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildQrView(context),
            Positioned(top: 10, child: buildControlButton()),
            Positioned(
                bottom: 10,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white24),
                  child: Text('ຍົກເລີກ',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                )),
            // Positioned(
            // bottom: 20,
            // child: buildResult()),
          ],
        ),
      ),
    );
  }

  Widget buildControlButton() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                icon: 
                // Icon(Icons.flash_on)
                FutureBuilder<bool>(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(snapshot.data? Icons.flash_on: Icons.flash_off,color: Colors.white,);
                    } else {
                      return Container();
                    }
                  },
                )
                ),
            IconButton(
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                 icon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(Icons.switch_camera,color: Colors.white,);
                    } else {
                      return Container();
                    }
                  },
                )),
          ],
        ),
      );
// Widget buildResult() => Text(barcode != null? 'Result : ${barcode.code} ': 'Scan Barcode',maxLines: 3,);
  Widget buildQrView(BuildContext context) {
    // var scanArea = (MediaQuery.of(context).size.width < 400 ||
    //         MediaQuery.of(context).size.height < 400)
    //     ? 150.0
    //     : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blue,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
        // cutOutSize: scanArea
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        this.barcode = scanData;
        if (this.barcode != null) {
          barcodeController.barcode = '${barcode.code}'.obs;
          Get.to(() => ScreenBarcode());
        } else {}
      });
    });
  }
}
