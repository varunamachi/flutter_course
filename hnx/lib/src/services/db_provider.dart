import 'dart:io';
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../models/item_model.dart';
import 'abstract_source.dart';
import 'abstract_cache.dart';

class DbProvider implements AbstractSource, AbstractCahce{
  Database db;

  DbProvider();


  @override
  Future<bool> init() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docDir.path, "items.db");
    this.db = await openDatabase(dbPath, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""CREATE TABLE items(
            id INTEGER NOT NULL PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER,
            text TEXT,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )""");
    });
    return this.db != null;
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final maps = await this.db.query(
      "items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<bool> addItem(ItemModel item) async {
    return await this.db.insert("items", item.toMap()) > 0;
  }

  @override
  Future<List<int>> fetchTopIds() {
    return null;
  }
}
