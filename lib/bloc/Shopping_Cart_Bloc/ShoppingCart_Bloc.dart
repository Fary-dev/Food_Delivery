import 'package:bloc/bloc.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

import 'events_Shopping_cart.dart';
import 'state_Shopping_Cart_bloc.dart';

class ShoppingCartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  ShoppingCart shoppingCart;

  ShoppingCartBloc()
      : super(SuccessCartState(shoppingCartList: [], setShoppingCartList: {}));
  List<ShoppingCart> shoppingCartOrder = <ShoppingCart>[];
  Set<ShoppingCart> setshoppingCartOrder = <ShoppingCart>{};

  Stream<CartBlocState> mapEventToState(CartBlocEvent event) async* {
    yield LodingCartState();
    try {
      if (event is AddToShoppingCart) {
        shoppingCartOrder.add(event.shoppingCart);
        setshoppingCartOrder.add(event.shoppingCart);
      }
      if (event is DeleteFromShoppingCart) {
        shoppingCartOrder.remove(event.shoppingCart);
        setshoppingCartOrder.remove(event.shoppingCart);
      }
      if (event is ClearAllShoppingCart) {
        shoppingCartOrder = [];
        setshoppingCartOrder = {};
      }

      yield SuccessCartState(
        shoppingCartList: shoppingCartOrder,
        setShoppingCartList: setshoppingCartOrder,
      );
    } catch (a) {
      yield FailCartState(massage: 'Versuche Es bitte nochmal !!');
    }
  }
}
