import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/screens/Home.dart';
import 'package:hospital_app/screens/LoadingPage.dart';
import 'package:hospital_app/screens/SignIn.dart';
import 'package:hospital_app/screens/user_Info_Form.dart';

import 'screens/SignUp.dart';

void main() => runApp(MaterialApp(
    initialRoute: 'UserInfoForm',
    routes: {
      'Loading': (context) => Loading(),
      'SignIn': (context) => SignIn(),
      'SignUp': (context) => SignUp(),
      'Home': (context) => Home(),
      'UserInfoForm': (context) => UserInfoForm()
    }
  )
);