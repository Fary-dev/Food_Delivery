import 'package:get/get.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class OrderController extends GetxController {
  RxList<Order> cartOrder = <Order>[].obs;
  RxSet<Product> setMyCart = <Product>{}.obs;

  addToCart(Order order) {
    cartOrder.add(order);
    setMyCart.add(order.product);
  }

  removeFromCart(Order order) {
    var selectProduct = cartOrder
        .firstWhere((element) =>
    element.product == order.product);
    cartOrder.remove(selectProduct);
  }

  clearAllCart() {
    cartOrder.value = [];
    setMyCart.value = {};
  }
}
