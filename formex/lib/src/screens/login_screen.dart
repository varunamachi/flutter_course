import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _formKey = new GlobalKey<FormState>();

  String _email = '';

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: getContent(),
        ),
      ),
    );
  }

  List<Widget> getContent() {
    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
          labelText: "Email Address",
          hintText: "user@example.com",
        ),
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onSaved: (String value) {
          this._email = value;
        },
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Your password",
        ),
        obscureText: true,
        validator: validatePassword,
        onSaved: (String value) {
          this._password = value;
        },
      ),
      Container(
        margin: EdgeInsets.only(top: 10.0),
      ),
      RaisedButton(
        child: Text("Submit"),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            print("Verified: $_email with $_password");
          }
        },
      ),
    ];
  }
}
