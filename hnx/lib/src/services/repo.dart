import 'dart:async';

import '../models/item_model.dart';
import 'abstract_source.dart';
import 'abstract_cache.dart';

class Repo {
  static final Repo _instance = Repo._internal();

  final sources = new List<AbstractSource>();
  final caches = List<AbstractCahce>();

  factory Repo() {
    return _instance;
  }

  Repo._internal();

  init() async {
    for (var cache in this.caches) {
      cache.init();
    }
  }

  Future<List<int>> fetchTopIds() async {
    List<int> ids;
    for (var source in this.sources) {
      ids = await source.fetchTopIds();
      if (ids != null) {
        break;
      }
    }
    return ids;
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    for (var source in this.sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        for (var cache in this.caches) {
            cache.addItem(item);
        }
        break;
      }
    }
    return item;
  }

  void addSource(AbstractSource source) {
    this.sources.add(source);
  }

  void addCache(AbstractCahce cache) {
    this.caches.add(cache);
  }

  Future<bool> clearCache() async {
    for (var cache in this.caches) {
      await cache.clear();
    }
    return true;
  }
}
