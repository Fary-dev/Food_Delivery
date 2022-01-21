
import 'package:get/get.dart';
import 'package:mjam/Sqlite/OrderModel.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class NotificationOfProduct extends GetxController {
  int showContainerCounterOfProduct(Product product,Resturant resturant,List<OrderModel> list){
    int e=0;
    for(var a in  list) {
      if (a.nameProduct == product.nameProduct &&
          a.nameResturant == resturant.nameResturant) {
        e++;
      }
    }
    return e;
  }
  bool checker(Product product,Resturant resturant,List<OrderModel> list){
    bool d=false;
    for(var a in  list) {
      if (a.nameProduct == product.nameProduct &&
          a.nameResturant == resturant.nameResturant) {
        d=true;
      }
    }
    return d;
  }
}
