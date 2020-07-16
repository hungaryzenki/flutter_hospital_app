import 'package:flutter/material.dart';
import 'package:hospital_app/SignIn.dart';
import 'package:hospital_app/SignUp.dart';
import 'LoadingPage.dart';
import 'package:hospital_app/Home.dart';

void main() => runApp(MaterialApp(
    initialRoute: 'SignIn',
    routes: {
      'Loading': (context) => Loading(),
      'SignIn': (context) => SignIn(),
      'SignUp': (context) => SignUp(),
      'Home': (context) => Home(),
    }

  )
);