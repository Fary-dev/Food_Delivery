import '../../models_and_data/models_and_data.dart';

abstract class BlocEvent {}

class AddToCart extends BlocEvent {
  Product pro;
  AddToCart({this.pro});
}

class DeleteFromCart extends BlocEvent {
  Product pro;
  DeleteFromCart({this.pro});
}
