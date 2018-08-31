import 'package:flutter/material.dart';

import '../blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @protected
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailWidget(bloc),
          passwordWidget(bloc),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailWidget(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.setEmail,
          decoration: InputDecoration(
            labelText: "EMail Address",
            hintText: "example@example.com",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordWidget(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.setPassword,
          decoration: InputDecoration(
            labelText: "Password",
            errorText: snapshot.error,
          ),
          obscureText: true,
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: snapshot.hasData
              ? bloc.submit
              : null,
        );
      },
    );
  }
}
