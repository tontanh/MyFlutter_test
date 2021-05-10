import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytestflutter/Getx/colorController.dart';
import 'package:mytestflutter/pages/homepage.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PHoneValidate extends StatefulWidget {
  var phone;
  PHoneValidate(this.phone);
  @override
  _PHoneValidateState createState() => _PHoneValidateState();
}

class _PHoneValidateState extends State<PHoneValidate> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final getcolor = Get.put(ControllerColor());
  TextEditingController phone = TextEditingController();
  TextEditingController pinnum = TextEditingController();
  String _verifyPhone;

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(5.0),
  );
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.phone,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            textinputPwd(),
            buttonWidget(),
          ],
        ),
      ),
    );
  }

  textinputPwd() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: Colors.green),
      ),
      padding: const EdgeInsets.all(20.0),
      child: PinPut(
        withCursor: true,
        fieldsCount: 6,
        //  preFilledWidget: FlutterLogo(),
        textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
        eachFieldWidth: 30.0,
        eachFieldHeight: 50.0,
        // onSubmit: (String pin) => _showSnackBar(pin),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration.copyWith(color: Colors.green),
        followingFieldDecoration: pinPutDecoration,
        onSubmit: (pin) async {
          pinnum.text = pin;
          // try {
          //   await FirebaseAuth.instance
          //     .signInWithCredential(PhoneAuthProvider.credential(
          //         verificationId: _verifyPhone, smsCode: pin))
          //     .then((value) async {
          //   if (value.user != null) {
          //     print('pass to home');

          //       Get.to(HomePage('HomePage Push'),transition: Transition.rightToLeft);
          //   }
          // });
          // } catch (e) {
          //   FocusScope.of(context).unfocus();
          //  Get.snackbar('Message', 'Invailed OTP');
          // }
        },
      ),
    );
  }

  buttonWidget() {
   
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: getcolor.controlColor(context)),
        child: Text(
          'ok',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
           print(pinnum.text);
          // _verifyPhonee();
          try {
            await FirebaseAuth.instance
                .signInWithCredential(PhoneAuthProvider.credential(
                    verificationId: _verifyPhone, smsCode: pinnum.text))
                .then((value) async {
              if (value.user != null) {
                print('pass to home');

                Get.to(HomePage('HomePage Push'),
                    transition: Transition.rightToLeft);
              }
            });
          } catch (e) {
            FocusScope.of(context).unfocus();
            Get.snackbar('Message', 'Invailed OTP');
          }
        },
      ),
    );
  }

  _verifyPhonee() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print('uer logined');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resenTOken) {
          setState(() {
            _verifyPhone = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verifycationID) {
          setState(() {
            _verifyPhone = verifycationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhonee();
  }
}
