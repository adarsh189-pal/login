import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home_screen.dart';

class PhoneAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
        ),
      ),
      body: PhoneAuthentication(),
    );
  }
}

class PhoneAuthentication extends StatefulWidget {
  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                hintText: 'Mobile Number',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10))),
      Container(
        child: RaisedButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.red,
          child: Center(
            child: Text(
              'Sign up using your mobile number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        height: 50,
        margin: EdgeInsets.only(left: 90, right: 90, top: 20),
      )
    ]);
  }
}
