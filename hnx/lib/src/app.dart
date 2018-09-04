import 'package:flutter/material.dart';

import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';

import 'screen/news_list.dart';
import 'screen/news_details.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: "HN Walker",
          home: NewsList(),
          onUnknownRoute: routes,
        ),
      ),
    );
  }

  Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(
        builder: (BuildContext ctx) => NewsList(),
      );
    } else {
      final index = settings.name.indexOf("/item/");
      if (index != -1) {
        final idStr = settings.name.substring(index + 6);
        final id = int.parse(idStr);
        if (id is int) {
          return MaterialPageRoute(
            builder: (BuildContext ctx) {
              CommentsProvider.of(ctx).fetchComments(id); //async fetch
              return NewsDetails(id: id);
            }
          );
        }
        return MaterialPageRoute(
          builder: (BuildContext ctx) => Center(child: Text("Invalid ID...")),
        );
      }
    }
    return MaterialPageRoute(
      builder: (BuildContext ctx) => Center(child: Text("Not found...")),
    );
  }
}
