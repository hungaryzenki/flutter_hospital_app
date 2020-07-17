import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


import '../auth.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Auth _auth = new Auth();
  String email;

  Future<void> getEmail() async {
    email = await _auth.getEmail();
    print('$email');
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
                '$email',
                style: TextStyle(color: Colors.black),
              ),
            FlatButton(
              color: Colors.blue,
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),

              ),
              onPressed: (){
                _auth.signOut();
                Navigator.pushNamed(context, "SignIn");
              },
            ),
          ],

        ),
      )
    );
  }
}

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
