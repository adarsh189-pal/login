import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            });
          },
          child: Container(
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10))),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            });
          },
          child: Container(
              child: Center(
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10))),
        )
      ],
    );
  }
}
