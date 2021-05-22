import '../../models_and_data/Class/models_and_data.dart';

abstract class BlocState {}

class LodingState extends BlocState {}

class SuccessState extends BlocState {
  List<Order> orderList;
  Set<Order> myOrderList;

  SuccessState({this.orderList, this.myOrderList});
}

class FailState extends BlocState {
  String massage;
  FailState({this.massage});
}
