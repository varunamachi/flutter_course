import 'dart:async';

import '../models/item_model.dart';

abstract class AbstractCahce {
  Future<bool> addItem(ItemModel item);

  Future<bool> init();
}
