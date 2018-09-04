import 'dart:async';

import 'package:flutter/material.dart';

import '../blocs/comments_provider.dart';
import '../models/item_model.dart';
import '../widgets/loading_container.dart';
import '../widgets/comment.dart';

class NewsDetails extends StatelessWidget {
  final int id;

  NewsDetails({this.id});

  @override
  Widget build(BuildContext context) {
    final bloc = CommentsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.comments,
      builder:
          (BuildContext ctx, AsyncSnapshot<Map<int, Future<ItemModel>>> asn) {
        if (!asn.hasData) {
          return CircularProgressIndicator();
        }
        final itemFuture = asn.data[id];
        return FutureBuilder(
          future: itemFuture,
          builder: (BuildContext ctx, AsyncSnapshot<ItemModel> itemAsn) {
            if (!itemAsn.hasData) {
              return LoadingContainer();
            }
            return buildStory(itemAsn.data, asn.data);
          },
        );
      },
    );
  }

  Widget buildStory(ItemModel story, Map<int, Future<ItemModel>> items) {
    final children = <Widget>[];
    children.add(buildTitle(story));
    final comments = story.kids.map((kidId) {
      return Comment(id: kidId, model: items);
    }).toList();
    children.addAll(comments);

    return ListView(
      children: children,
    );
  }
 
  Widget buildTitle(ItemModel model) {
    return Container(
      margin: EdgeInsets.all(10.0),
      // constraints: BoxConstraints.expand(),
      alignment: Alignment.topCenter,
      child: Text(
        model.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
