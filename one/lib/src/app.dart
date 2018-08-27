import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'model/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "First App",
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int cnt = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    ++ cnt;
    final resp = await get('https://jsonplaceholder.typicode.com/photos/$cnt');
    final img = ImageModel.fromJSON(json.decode(resp.body));
    setState(() {
      images.add(img);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      body: ImageList(this.images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add,),
      ),
    );
  }

}