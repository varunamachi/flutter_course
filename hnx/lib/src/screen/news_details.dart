import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final int id;

  NewsDetails({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),  
      ),
      body: Text("ID: $id"),
    );
  }
}