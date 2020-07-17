import 'package:flutter/material.dart';
import 'package:hospital_app/screens/Home.dart';
import 'package:hospital_app/screens/LoadingPage.dart';
import 'package:hospital_app/screens/SignIn.dart';

import 'screens/SignUp.dart';

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