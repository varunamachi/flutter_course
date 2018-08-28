import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Log In",
      home: Scaffold(
        appBar: AppBar(title: Text("Log In")),
        body: LoginScreen(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.lock),
          onPressed: null,
        ),
      ),
    );
  }
}
