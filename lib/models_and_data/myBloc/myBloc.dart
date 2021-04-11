import 'package:flutter/cupertino.dart';

class MyBlock extends ChangeNotifier {
  String _location = '';
  get location => _location;
  void setLocation(String value) {
    _location = value;
  }

  // int showItemsCurrentOfProduct;
  // int itemCurrent = 1;
  // double sub;
  // void subItems(double b) {
  //   // ignore: unused_local_variable
  //   double c = itemCurrent * b;
  //   sub = c;
  //   print(sub);
  // }

  // void showCurrent() {
  //   showItemsCurrentOfProduct = showItemsCurrentOfProduct + itemCurrent;
  //   itemCurrent = 1;
  //   print(showItemsCurrentOfProduct);
  // }
}

//=========== shopping Carts model ================================
