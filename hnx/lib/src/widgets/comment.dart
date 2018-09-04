import 'dart:async';

import 'package:flutter/material.dart';

import '../models/item_model.dart';
import 'loading_container.dart';

class Comment extends StatelessWidget {
  final int id;

  final int depth;

  final Map<int, Future<ItemModel>> model;

  Comment({this.id, this.model, this.depth = 1});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.model[this.id],
        builder: (BuildContext ctx, AsyncSnapshot<ItemModel> asn) {
          if (!asn.hasData) {
            return LoadingContainer();
          }
          final item = asn.data;
          final children = <Widget>[
            ListTile(
              title: buildText(item),
              subtitle: Text(item.by == "" ? "Deleted" : item.by),
              contentPadding: EdgeInsets.only(left: 10.0 * depth, right: 16.0),
            ),
            Divider(
              height: 10.0,
            ),
          ];
          asn.data.kids.forEach((kidId) {
            children.add(
              Comment(
                id: kidId,
                model: this.model,
                depth: this.depth + 1,
              ),
            );
          });
          return Column(
            children: children,
          );
        });
  }

  Widget buildText(ItemModel item) {
    if (item.text == "") {
      return Text("DELETED");
    }
    final text = item.text
      .replaceAll("&#x27;", "'")
      .replaceAll("<p>", "\n\n")
      .replaceAll("<p>", '')
      ..replaceAll("&quot;", "\"");
    return Text(text);

  }
}
