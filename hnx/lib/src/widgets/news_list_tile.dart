import 'dart:async';

import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';
import 'loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int id;

  NewsListTile({this.id});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder<Map<int, Future<ItemModel>>>(
      stream: bloc.items,
      builder:
          (BuildContext ctx, AsyncSnapshot<Map<int, Future<ItemModel>>> asn) {
        if (!asn.hasData) {
          return LoadingContainer();
        }
        return FutureBuilder(
          future: asn.data[this.id],
          builder: (BuildContext ctx, AsyncSnapshot<ItemModel> asn) {
            if (!asn.hasData) {
              return LoadingContainer();
            }
            return buildTile(asn.data);
          },
        );
      },
    );
  }

  Widget buildTile(ItemModel item) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(item.title),
          subtitle: Text("Score: ${item.score}"),
          trailing: Column(
            children: <Widget>[
              Icon(Icons.comment),
              Text("${item?.descendants}"),
            ],
          ),
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }
}
