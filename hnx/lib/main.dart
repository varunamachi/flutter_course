import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/services/repo.dart';
import 'src/services/db_provider.dart';
import 'src/services/api_provider.dart';

void main() {
  final repo = new Repo()
    ..addSource(new ApiProvider())
    ..addSource(new DbProvider())
    ..addCache(new DbProvider());
  repo.init();
  runApp(new App());
}
