import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

// here the loginscreen widget is stateless because the BLOC keeps the state not the widget itself

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          fieldEmail(),
          Container(margin: EdgeInsets.only(top: 20.0)),
          fieldPassw(),
          Container(margin: EdgeInsets.only(top: 20.0)),
          buttonSubmit(),
        ],
      ),
    );
  }

  Widget fieldEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(hintText: 'you at example dot domain', labelText: 'Email address'),
    );
  }

  Widget fieldPassw() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'PassWord999!%^', labelText: 'Password'),
    );
  }

  Widget buttonSubmit() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.lightGreen,
      onPressed: () {},
    );
  }
}
