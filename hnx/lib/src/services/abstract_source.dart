import 'dart:async';

import '../models/item_model.dart';

abstract class AbstractSource {
  Future<List<int>> fetchTopIds();

  Future<ItemModel> fetchItem(int id);

}