import '../../models_and_data/models_and_data.dart';

abstract class BlocState {}

class LodingState extends BlocState {}

class SuccessState extends BlocState {
  List<Product> productsList;
  List<int> currentList;
  SuccessState({this.productsList, this.currentList});
}

class FailState extends BlocState {
  Error fail;
  FailState({this.fail});
}
