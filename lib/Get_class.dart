class Serializer {
  List<String>? categories;
  String? id;
  String? url;
  String? value;

  Serializer({this.categories, this.id, this.url, this.value});

  Serializer.fromJson(Map<String, dynamic> json) {
    if (json['categories'].length != 0) {
      categories = <String>[];
      json['categories'].forEach((v) {
        categories?.add(v);
      });
    }
    id = json['id'];
    url = json['url'];
    value = json['value'];
  }
}
