import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Welcome App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid ='';

  getUid () {}
  @override
  void initState() {
    this.uid = '';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid = val.uid;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      'You are logged in successfully $uid',
      style: TextStyle(fontSize: 30, color: Colors.blue),
    );
  }
}
