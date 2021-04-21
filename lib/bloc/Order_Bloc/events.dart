import '../../models_and_data/Class/models_and_data.dart';

abstract class BlocEvent {}

class AddToCart extends BlocEvent {
  Order order;
  AddToCart({this.order});
}

class DeleteFromCart extends BlocEvent {
  Order order;
  DeleteFromCart({this.order});
}

class ClearAllCart extends BlocEvent {}
//_______________________________ Counter _________________________________
