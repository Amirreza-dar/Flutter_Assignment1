// import 'package:test1/Get_class.dart';
// import 'Get_class.dart';
// import 'dart:math';
// import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
// import 'Get_class.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

void main(){
  print('ddd');
  CurrentJoke X = CurrentJoke();
  X.getData();
  print(X.value);
  Timer(Duration(seconds: 3), () {

    print(X.value);
    X.add();
    print(X.Favs);
  });

}

class CurrentJoke{

  Serializer fetched_joke = Serializer();
  List<String>? categories;
  String? id;
  String? url;
  String? value;
  Set<String?> Favs = Set();

  Future<void> getData() async {
    Uri url = Uri.parse('https://api.chucknorris.io/jokes/random');
    http.Response res = await http.get(url);
    dynamic body = cnv.jsonDecode(res.body);
    fetched_joke = Serializer.fromJson(body);
    Serialize(fetched_joke);
    print('Data just loaded! SetState()!');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(id ?? '0', value ?? 'Joke Not found!!');
    final joke = prefs.getString( id ?? '');
    print(joke);
  }

  void Serialize(Serializer value1){
    categories = value1.categories;
    id = value1.id;
    url = value1.url;
    value = value1.value;

  }
  void add() {
    Favs.add(value);
    // Favs.add(CurrentJoke.Fav(category_: categories, id_: id, url_: url, value_: value));
  }
  CurrentJoke({this.categories, this.id, this.url, this.value});
  CurrentJoke.Fav({List<String>? category_, String? id_, String? url_, String? value_}){
    categories = category_;
    id = id_;
    url = url_;
    value = value_;
  }
}



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
    // print(value);
  }
  @override
  String toString() {
    // TODO: implement toString
    return "THIS IS SERIALZIER!!";
  }
}







