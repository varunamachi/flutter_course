import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel(
      {this.id,
      this.deleted,
      this.type,
      this.by,
      this.time,
      this.text,
      this.dead,
      this.parent,
      this.kids,
      this.url,
      this.score,
      this.title,
      this.descendants});

  ItemModel.fromJSON(Map<String, dynamic> data)
      : id = data["id"],
        deleted = data["deleted"] ?? false,
        type = data["type"],
        by = data["by"],
        time = data["time"],
        text = data["text"],
        dead = data["dead"] ?? false,
        parent = data["parent"],
        kids = data["kids"],
        url = data["url"],
        score = data["score"],
        title = data["title"],
        descendants = data["descendants"] ?? 0;

  ItemModel.fromDb(Map<String, dynamic> data)
      : id = data["id"],
        deleted = data["deleted"] != 0,
        type = data["type"],
        by = data["by"],
        time = data["time"],
        text = data["text"],
        dead = data["dead"] != 0,
        parent = data["parent"],
        kids = jsonDecode(data["kids"]),
        url = data["url"],
        score = data["score"],
        title = data["title"],
        descendants = data["descendants"];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "deleted": deleted ? 1 : 0,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "dead": dead ? 1 : 0,
      "parent": parent,
      "kids": jsonEncode(kids),
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants,
    };
  }
}
