
class ImageModel {
  int albumID;
  int id;
  String url;
  String title;
  String thumbnailUrl;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJSON(Map<String, dynamic> content) {
    this.albumID = content['albumID'];
    this.id = content['id'];
    this.url = content['url'];
    this.title = content['title'];
    this.thumbnailUrl = content['thumbnailUrl'];
  }

  @override
  String toString() {
    return this != null ? this.title : "NULL";
  }
}