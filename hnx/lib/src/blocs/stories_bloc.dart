import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../services/repo.dart';

class StoriesBloc {
  final _repo = new Repo();
  final _topIds = new PublishSubject<List<int>>();

  Observable<List<int>> get topIds => _topIds.stream;

  void fetchTopIds() async {
    final ids = await this._repo.fetchTopIds();
    this._topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }

}