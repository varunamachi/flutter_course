import 'package:flutter/material.dart';

import 'screens/LoginScreen.dart';

import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
      title: 'Log In!',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Log In"),
        ),
        body: LoginScreen(),
      )
    ),
    );
  }

}