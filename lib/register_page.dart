import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
                final newUser = await _auth.createUserWithEmailAndPassword(
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
          child: RaisedButton(
            onPressed: () async {
              _firestore.collection('userdetail').add({
                'useremail': email,
                'userpassword': password,
              });

              Future<FirebaseUser> _handleSignIn() async {
                final GoogleSignInAccount googleUser =
                    await _googleSignIn.signIn();
                final GoogleSignInAuthentication googleAuth =
                    await googleUser.authentication;

                final AuthCredential credential =
                    GoogleAuthProvider.getCredential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken,
                );

                final FirebaseUser user =
                    (await _auth.signInWithCredential(credential)).user;
                print("signed in " + user.displayName);
                return user;
              }

              _handleSignIn()
                  .then((FirebaseUser user) => print(user))
                  .catchError((e) => print(e));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.red,
            child: Text(
              'Login with google',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
