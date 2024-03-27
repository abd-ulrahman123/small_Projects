import 'package:flutter/material.dart';

class Signin with ChangeNotifier {
  bool isSigned = true;

  notSigned(){
    isSigned = false;
    notifyListeners();
  }

}