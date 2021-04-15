import '../../models_and_data/models_and_data.dart';

//TODO: Product Bloc
abstract class BlocEvent {}

class AddToCart extends BlocEvent {
  Order order;
  AddToCart({this.order});
  void increment(int) {
    int++;
  }
}

class DeleteFromCart extends BlocEvent {
  Order order;
  DeleteFromCart({this.order});
  void dicrement(int) {
    int--;
  }
}

class ClearAllCart extends BlocEvent {}
