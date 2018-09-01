import 'dart:convert';

import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';
import 'package:hnx/src/services/api_provider.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final apiProvider = new ApiProvider()
      ..client = MockClient((Request request) async {
        final body = json.encode([1, 2, 3, 4]);
        return Response(body, 200);
      });
      final ids = await apiProvider.fetchTopIds();
      expect(ids, <dynamic>[1, 2, 3, 4]);
  });
  test("FetchItem returns a item model", () async {
    final apiProvider = new ApiProvider()
    ..client = new MockClient((Request request) async {
      final body = json.encode({
        "id": 123,
        "deleted": false,
        "type": "story",
        "by": "babu",
        "time": 32312312423,
        "text": "Test test test",
        "dead": false,
        "parent": 0,
        "kids": [],
        "url": "https://example.com",
        "score": 0,
        "title": "Text",
        "descendants": 0,
      });
      return Response(body, 200);
    });
    final item = await apiProvider.fetchItem(123);
    expect(item.id, 123);
  });

}
