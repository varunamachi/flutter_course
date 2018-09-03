import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../services/repo.dart';

class StoriesBloc {
  final _repo = new Repo();
  final _topIds = new PublishSubject<List<int>>();
  final _itemsOutput = new BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _itemsFetcher = new PublishSubject<int>();

  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc() {
    this._itemsFetcher.stream.transform(_itemTransformer()).pipe(_itemsOutput);
  }

  void fetchTopIds() async {
    final ids = await this._repo.fetchTopIds();
    this._topIds.sink.add(ids);
  }

  Future<bool> clearCache() async {
    return this._repo.clearCache();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel>> cache, int id, int index) {
      cache[id] = _repo.fetchItem(id);
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  dispose() {
    _topIds.close();
    _itemsOutput.close();
    _itemsFetcher.close();
  }
}
