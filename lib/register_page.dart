import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/phone_auth.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser _user;

  GoogleSignIn _googleSignIn = new GoogleSignIn();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: TextFormField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
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
              onChanged: (value) {
                password = value;
              },
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
          margin: EdgeInsets.only(left: 90, right: 90, top: 20),
          child: RaisedButton(
            onPressed: () async {
              _firestore.collection('userdetail').add({
                'useremail': email,
                'userpassword': password,
              });
              try {
                final newUser = await auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePageScreen()));
                }
              } catch (e) {
                print(e);
              }
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.red,
            child: Center(
              child: Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 80, right: 80, top: 20),
          child: isSignIn
              ? Center(
                  child: Column(
                    children: [
                      Text(_user.displayName),
                      OutlineButton(
                        onPressed: () {
                          googleSignOut();
                        },
                        child: Text('Logout'),
                      )
                    ],
                  ),
                )
              : Center(
                  child: OutlineButton(
                    onPressed: () {
                      handleSignIn();
                    },
                    child: Text(
                      'Login with google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 80, right: 80, top: 20),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhoneAuthPage()));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.red,
            child: Center(
              child: Text(
                'Sign up with phone number',
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

  bool isSignIn = false;
  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    AuthResult result = (await auth.signInWithCredential(credential));
    _user = result.user;
    setState(() {
      isSignIn = true;
    });
  }

  Future<void> googleSignOut() async {
    await auth.signOut().then((value) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
  }
}
