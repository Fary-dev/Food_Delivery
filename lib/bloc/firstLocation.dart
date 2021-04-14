import 'dart:core';
import 'package:flutter/cupertino.dart';

class DefultLocation extends ChangeNotifier {
//==================================== location ================================

  String _location = '';
  get location => _location;
  void setLocation(String value) {
    _location = value;
  }
}
