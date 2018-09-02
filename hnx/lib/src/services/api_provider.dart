import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' show Client;

import '../models/item_model.dart';
import 'abstract_source.dart';

class ApiProvider extends AbstractSource {
  static const _TOP_URL =
      "https://hacker-news.firebaseio.com/v0/topstories.json";

  static const _STORY_URL = "https://hacker-news.firebaseio.com/v0/item/";

  Client client = new Client();

  Future<List<int>> fetchTopIds() async {
    var resp = await client.get(_TOP_URL);
    if (resp.statusCode == 200) {
      final ids = json.decode(resp.body);
      return ids.cast<int>();
    }
    return new List<int>();
    
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final url = _STORY_URL + "$id.json";
    final resp = await client.get(url);
    if (resp.statusCode == 200) {
      final data = json.decode(resp.body);
      return ItemModel.fromJSON(data);
    }
    return new ItemModel();
  }
}
