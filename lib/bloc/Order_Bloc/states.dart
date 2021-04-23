import '../../models_and_data/Class/models_and_data.dart';

abstract class BlocState {}

class LodingState extends BlocState {}

class SuccessState extends BlocState {
  List<Order> orderList;
  SuccessState({
    this.orderList,
  });
}

class FailState extends BlocState {
  String massage;
  FailState({this.massage});
}