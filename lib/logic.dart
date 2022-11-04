import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
// import 'Get_class.dart';
import 'package:test1/Data.dart';


class Logic extends ChangeNotifier{

  CurrentJoke CJ = CurrentJoke();
  // FavouritesJokes FJ = FavouritesJokes();
  // JokeAPI joke_api = JokeAPI(FavouritesJokes: FavouritesJokes(), CurrentJoke : CurrentJoke());
  void initiate(){
    CJ.getData();
    notifyListeners();
  }
  void Add(){
    // Send an event to Bloc;
    CJ.Favs.add(CJ.value);
    notifyListeners();
  }


}
