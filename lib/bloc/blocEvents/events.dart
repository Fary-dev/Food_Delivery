import '../../models_and_data/models_and_data.dart';

abstract class BlocEvent {}

class AddToCart extends BlocEvent {
  Product product;
  int current;
  AddToCart({this.product, this.current});
}

class DeleteFromCart extends BlocEvent {
  Product product;
  Current current;
  DeleteFromCart({this.product, this.current});
}

class ClearAllCart extends BlocEvent {}
