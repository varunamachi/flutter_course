import 'package:flutter/material.dart';

import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @protected final bloc = new Bloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailWidget(),
          passwordWidget(),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailWidget() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "EMail Address",
        hintText: "example@example.com",
        errorText: null,
      ),
    );
  }

  Widget passwordWidget() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Password",
        errorText: null,
      ),
      obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: (){
      },
    );
  }
}

