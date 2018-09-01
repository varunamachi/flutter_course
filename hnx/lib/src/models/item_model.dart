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

  ItemModel.fromJSON(Map<String, dynamic> jsonData)
      : id = jsonData["id"],
        deleted = jsonData["deleted"],
        type = jsonData["type"],
        by = jsonData["by"],
        time = jsonData["time"],
        text = jsonData["text"],
        dead = jsonData["dead"],
        parent = jsonData["parent"],
        kids = jsonData["kids"],
        url = jsonData["url"],
        score = jsonData["score"],
        title = jsonData["title"],
        descendants = jsonData["descendants"];
}
