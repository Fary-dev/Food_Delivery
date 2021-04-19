import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/models_and_data/models_and_data.dart';
import 'events.dart';
import 'states.dart';

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  Order order;

  ProductBloc() : super(SuccessState(orderList: []));

  List<Order> cartOrder = [];
  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LodingState();
    try {
      if (event is AddToCart) {
        cartOrder.add(event.order);
      }
      if (event is DeleteFromCart) {
        cartOrder.remove(event.order);
      }
      if (event is ClearAllCart) {
        cartOrder = [];
      }
      yield SuccessState(orderList: cartOrder);
    } catch (e) {
      yield FailState(fail: e);
    }
  }
}
