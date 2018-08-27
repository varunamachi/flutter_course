import 'package:flutter/material.dart';
import '../model/image_model.dart';

class ImageList extends StatelessWidget {

  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          final img = images[index];
          if (img != null) {
            return Text("hello ${img.url}");
          }
        },
    );
  }
}

