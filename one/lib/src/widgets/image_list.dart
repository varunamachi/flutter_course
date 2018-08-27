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
            return buildImage(img);
          }
        },
    );
  }

  Widget buildImage(ImageModel img) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Image.network(img.url),
          ),
          Text(img.title),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
    );
  }
}

