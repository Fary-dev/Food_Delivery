/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'events.dart';
import 'states.dart';

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  Order order;

  ProductBloc() : super(SuccessState(orderList: []));
  List<Order> cartOrder = <Order>[];
  Set<Product> setMyCart = <Product>{};

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LodingState();
    try {
      if (event is AddToCart) {
        cartOrder.add(event.order);
        setMyCart.add(event.product);
      }
      if (event is DeleteFromCart) {
        cartOrder.remove(event.order);
        setMyCart.remove(event.product);
      }
      if (event is ClearAllCart) {
        cartOrder = [];
        setMyCart = {};
      }
      if (event is SetAllCart) {}

      yield SuccessState(
        orderList: cartOrder,
        setMyProductsList: setMyCart,
      );
    } catch (a) {
      yield FailState(massage: 'Versuche Es bitte nochmal !!');
    }
  }
}
*/
