import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _nameController, _phoneController, _addressController;
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    FormState state;
    //TODO: sync data into USER class and push to cloud
    /*void validateAndSave() {
      final FormState form = _formkey.currentState;
      if (form.validate()) {
        print('Form is valid');
      } else {
        print('Form is invalid');
      }
    }*/

    return Scaffold(
      appBar: AppBar(
        title: Text('Please input your information', style: TextStyle(fontWeight: FontWeight.bold))
      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],

                controller: _nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name'
                  ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Enter your name';
                  }
                  else if(value.contains(RegExp(r'[a-zA-Z]'))) return 'Invalid name!';
                  return null;
                },
                /*onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },*/
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  icon: Icon(Icons.home),
                  hintText: 'Where do you live?',
                  labelText: 'Address'
                ),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'What is your phone number?',
                  labelText: 'Phone'
                ),
                keyboardType: TextInputType.number,
                validator: (String value){
                  //value.contains(new RegExp(r'[A-Z]')) ? null ;
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                width: 100.0,
                color: Colors.blue,
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text('Update'),
                  onPressed: (){
                    print('updated');
                    state = _formkey.currentState;
                    state.validate()/* ? print('valid') : print('invalid')*/;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
