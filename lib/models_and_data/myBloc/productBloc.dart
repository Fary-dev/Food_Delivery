import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/models_and_data/myBloc/models_and_data.dart';

abstract class BlocEvent {}

abstract class BlocState {}

class AddToCart extends BlocEvent {
  Product pro;
  AddToCart({this.pro});
}

class DeleteFromCart extends BlocEvent {
  Product pro;
  DeleteFromCart({this.pro});
}

class LodingState extends BlocState {}

class SuccessState extends BlocState {
  int cunt;
  SuccessState({this.cunt});
}

class FailState extends BlocState {
  Error fail;
  FailState({this.fail});
}

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  ProductBloc() : super(null);
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
      yield SuccessState(cunt: cartProduct.length);
    } catch (e) {
      yield FailState(fail: e);
    }
  }
}