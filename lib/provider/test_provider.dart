import 'package:flutter/material.dart';
class TestProvider with ChangeNotifier {
  String _nameProvider = 'Providerbyton';
 
  String get providerGet => _nameProvider;
  set providerGet(String newName){
      _nameProvider = newName;
      notifyListeners();  
  }
}