import 'package:flutter/material.dart';
import 'package:test1/Data.dart';

class Logic extends ChangeNotifier{

  CurrentJoke CJ = CurrentJoke();
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
