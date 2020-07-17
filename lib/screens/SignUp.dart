import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../auth.dart';


void main() =>  runApp(MaterialApp(
    home: SignUp()
));



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  Auth _auth = new Auth();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 120.0,
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ), //SignUp Title
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: _emailController,
                    autofocus: false,
                    maxLines: 1,
                    decoration: InputDecoration(hintText: 'Your Email, example: abc@gmail.com'),
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ), //Email TextField
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: _passwordController,
                    autofocus: false,
                    obscureText: true,
                    maxLines: 1,
                    decoration: InputDecoration(hintText: 'Your password, atleast 6 characters.'),
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ), //Password TextField
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: _passwordConfirmController,
                    autofocus: false,
                    obscureText: true,
                    maxLines: 1,
                    decoration: InputDecoration(hintText: 'Your password Confirmation'),
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ), //Password Confirm TextField
              ],
            ),//TextFields
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: FlatButton(
                      onPressed: () async {
                        String _email = _emailController.text.trim();
                        String _password = _passwordController.text.trim();
                        String _passwordConfirm = _passwordConfirmController.text.trim();
                        if (_password !=
                            _passwordConfirm) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Notice"),
                                content: Text(
                                    "Your password confirmation is not correct. Please try again!"),
                                actions: [
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }//password confirmation error dialog
                        else if(_password.length<6){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Notice"),
                                content: Text(
                                    "Your password is too short!. Please try again!"),
                                actions: [
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        } //password is too short error dialog
                        else {
                          dynamic user = await _auth.signUp(_email, _password);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Notice"),
                                content: Text(
                                    "Success"),
                                actions: [
                                  FlatButton(
                                    child: Text("Press to go to Login page."),
                                    onPressed: () {
                                      Navigator.pushNamed(context,'SignIn');
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }//SignUp Success!
                      },
                      child: Text(
                          'Sign Up', style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    ),
                  ), //SignUp Flat Button
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                          'Cancel', style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    ),
                  ), //Cancel Flat Button
                ],
              ),//Buttons
          ],
        )
    );
  }
}
