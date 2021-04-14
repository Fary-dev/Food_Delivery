import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/models_and_data/models_and_data.dart';

import 'blocEvents/events.dart';
import 'blocStates/states.dart';

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  ProductBloc() : super(SuccessState(prod: []));
  List<Product> cartProduct = [];
  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LodingState();
    try {
      if (event is AddToCart) {
        cartProduct.add(event.pro);
      }
      if (event is DeleteFromCart) {
        cartProduct.remove(event.pro);
      }
      yield SuccessState(prod: cartProduct);
    } catch (e) {
      yield FailState(fail: e);
    }
  }
}
