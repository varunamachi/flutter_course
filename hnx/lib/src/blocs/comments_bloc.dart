import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../models/item_model.dart';
import '../services/repo.dart';

class CommentsBloc {
  final _repo = new Repo();
  final _fetcher = new PublishSubject<int>();
  final _output = new BehaviorSubject<Map<int, Future<ItemModel>>>();

  Observable<Map<int, Future<ItemModel>>> get comments => _output.stream;
  Function(int) get fetchComments => _fetcher.sink.add;

  CommentsBloc() {
    _fetcher.transform(_getCommentTransformer()).pipe(_output);
  }

  StreamTransformer _getCommentTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
      (Map<int, Future<ItemModel>> cache, int id, int index) {
        print(index);
        cache[id] = _repo.fetchItem(id);
        cache[id].then((ItemModel item) {
          item.kids?.forEach((id) => fetchComments(id));
        });
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _fetcher.close();
    _output.close();
  }
}
