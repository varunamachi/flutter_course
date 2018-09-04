import 'package:flutter/material.dart';
import 'comments_bloc.dart';
export 'comments_bloc.dart';

class CommentsProvider extends InheritedWidget {
  final CommentsBloc bloc;

  CommentsProvider({GlobalKey key, Widget child})
      : bloc = new CommentsBloc(),
        super(key: key, child: child) {}

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CommentsBloc of(BuildContext ctx) {
    return (ctx.inheritFromWidgetOfExactType(CommentsProvider)
            as CommentsProvider)
        .bloc;
  }
}
