import 'package:flutter/material.dart';

class MyProvid extends ChangeNotifier{
  String language='en';
  void changeLanguage(String newLang){
    language=newLang;
    notifyListeners();
  }
}