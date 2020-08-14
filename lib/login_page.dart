import 'package:flutter/material.dart';
import 'package:login/home_screen.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10))),
        Container(
            child: TextFormField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  hintText: 'Password',
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
          height: 50,
          margin: EdgeInsets.only(left: 110, right: 110, top: 20),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()));
              });
            },
            color: Colors.red,
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
