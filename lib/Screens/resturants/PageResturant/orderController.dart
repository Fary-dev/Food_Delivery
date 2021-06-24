import 'package:get/get.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class OrderController extends GetxController {
  /*Order order;
  Product product;*/
  RxList<Order> cartOrder = <Order>[].obs;
  RxSet<Product> setMyCart = <Product>{}.obs;

  addToCart(Order order) {
    cartOrder.add(order);
    setMyCart.add(order.product);
  }

  removeFromCart(Order order) {
    cartOrder.remove(order);
    setMyCart.remove(order.product);
  }

  clearAllCart() {
    cartOrder.value = [];
    setMyCart.value = {};
  }
}
