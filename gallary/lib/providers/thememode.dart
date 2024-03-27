import 'package:flutter/material.dart';
class ModeTheme with ChangeNotifier {
   bool them = true;
  
   changetheme(){
    them =! them ;
    notifyListeners();
  }

}