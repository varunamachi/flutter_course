import 'dart:async';

import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';
import "../widgets/news_list_tile.dart";
import "../widgets/refresh.dart";

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News"),
      ),
      body: this.buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    // return ListView.builder(
    //   itemCount: 1000,
    //   itemBuilder: (BuildContext context, int index) {
    //     return FutureBuilder(
    //       future: getItem(bloc),
    //       builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
    //         return snapshot.hasData
    //           ? Text("Done!")
    //           : Text("Loading...");
    //       },
    //     );
    //   },
    // );
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (BuildContext context, AsyncSnapshot<List<int>> asnap) {
        if (!asnap.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Refresh(
          child: ListView.builder(
              itemCount: asnap.data.length,
              itemBuilder: (BuildContext ctx, int index) {
                bloc.fetchItem(asnap.data[index]);
                return NewsListTile(id: asnap.data[index]);
              }),
        );
      },
    );
  }

  Future<ItemModel> getItem(StoriesBloc bloc) {
    return Future.delayed(
      Duration(seconds: 2),
      () => ItemModel(),
    );
  }
}
