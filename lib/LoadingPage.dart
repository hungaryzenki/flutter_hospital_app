import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Auth _auth = Auth();

  @override
  void initState() {
    //FirebaseUser user = _auth.getEmail();
    super.initState();
    _handleLoading();
  }
  Future<void> _handleLoading() async {
    if (await _auth.isLoggedIn()) Navigator.pushNamed(context, 'Home');
    else Navigator.pushNamed(context, 'SignIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.android,
          size: 300.0,
        ),
      ),
    );
  }
}
