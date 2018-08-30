import 'package:flutter/material.dart';

import 'screens/LoginScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log In!',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Log In"),
        ),
        body: LoginScreen(),
      )
    );
  }

}