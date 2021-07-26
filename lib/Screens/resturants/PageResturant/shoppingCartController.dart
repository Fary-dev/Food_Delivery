import 'package:get/get.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class ShoppingCartController extends GetxController{
  ShoppingCart shoppingCart;

  RxList<ShoppingCart> shoppingCartOrder = <ShoppingCart>[].obs;
  RxSet<ShoppingCart> setShoppingCartOrder = <ShoppingCart>{}.obs;

  addToShoppingCart(){
    shoppingCartOrder.add(shoppingCart);
    setShoppingCartOrder.add(shoppingCart);
  }

  deleteFromShoppingCart(){
    shoppingCartOrder.remove(shoppingCart);
    setShoppingCartOrder.remove(shoppingCart);
  }

  clearAllShoppingCart(){
    shoppingCartOrder.clear();
    setShoppingCartOrder.clear();
  }
  
}