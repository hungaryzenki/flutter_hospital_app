import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'Home.dart';
import 'auth.dart';

void main() =>  runApp(MaterialApp(
    home: SignIn(),
  )
);

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String email, password;
  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 30.0),
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),//LOGIN title
          Container(
            width: 300.0,
            child: TextField(
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              controller: _emailController,
              autofocus: false,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Email'),
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),//Email TextField
          Container(
            width: 300.0,
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              autofocus: false,
              obscureText: true,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Password'),
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),//Password TextField
          Container(
            margin: EdgeInsets.only(top:15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text('Sign in', style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () async {
                      dynamic user = await _auth.signIn(_emailController.text.trim(), _passwordController.text.trim());
                      if (_emailController.text.isEmpty==true && _passwordController.text.trim().isEmpty == true)
                        popDialog("Please type your email and password");
                      else if (user == null) popDialog("Please check your email and password and try again.");                      //SignIn error dialog
                      else Navigator.pushNamed(context, "Home");
                    },
                  ),
                ),//Sign In flat button
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text('Sign up', style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: (){
                      Navigator.pushNamed(context, 'SignUp');
                    },
                  ),
                ),//Sign Up flat button
              ],
            ),
          ),//Buttons
        ],
      ),
    );
  }
  void popDialog(String text){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notice"),
          content: Text("$text"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {Navigator.of(context).pop();},
            )
          ],
        );
      },
    );
  }
}



