import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/models_and_data/models_and_data.dart';

import 'blocEvents/events.dart';
import 'blocStates/states.dart';

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  ProductBloc()
      : super(SuccessState(
          productsList: [],
        ));
  List<Product> cartProduct = [];
  List<Current> cuntersList = [];

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LodingState();
    try {
      if (event is AddToCart) {
        cartProduct.add(event.product);
        cuntersList.add(event.current);
      }
      if (event is DeleteFromCart) {
        cartProduct.remove(event.product);
        cuntersList.remove(event.current);
      }
      yield SuccessState(productsList: cartProduct);
    } catch (e) {
      yield FailState(fail: e);
    }
  }
}