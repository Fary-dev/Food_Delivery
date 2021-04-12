import 'package:flutter/cupertino.dart';

class MyBloc extends ChangeNotifier {
//==================================== location ================================

  String _location = '';
  get location => _location;
  void setLocation(String value) {
    _location = value;
  }
//======================== shopping Cart  model ================================

}
