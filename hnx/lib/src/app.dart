import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HN Walker",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hacker News"),
        ),
        body: Center(
          child: Text("Placeholder"),
        ),
      ),
    );
  }

}