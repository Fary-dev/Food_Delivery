import '../../models_and_data/models_and_data.dart';

//TODO: Product Bloc
abstract class BlocEvent {}

class AddToCart extends BlocEvent {
  Product product;
  Current current;
  AddToCart({this.product, this.current});
}

class DeleteFromCart extends BlocEvent {
  Product product;
  Current current;
  DeleteFromCart({this.product, this.current});
}

//TODO: Counter Select Product
