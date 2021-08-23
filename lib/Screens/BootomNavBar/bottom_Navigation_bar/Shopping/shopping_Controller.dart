import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mjam/Sqlite/OrderModel.dart';

class ShoppingCartController extends GetxController {
  RxList<OrderModel> orderList=<OrderModel>[].obs;
  RxList<OrderModel>orderSet=<OrderModel>[].obs;
  RxList<TextEditingController> listController = <TextEditingController>[].obs;
  RxList<bool> commendSelect = <bool>[].obs;
  RxList<bool> buttonCheck = <bool>[].obs;

  setTextFieldController(countList) {
    for (int i = 0; i < countList; i++) {
      listController.add(TextEditingController());
      commendSelect.add(false);
      buttonCheck.add(false);
    }
  }

  revomeController(int indexList) {
    listController.removeAt(indexList);
    commendSelect.removeAt(indexList);
    buttonCheck.removeAt(indexList);
  }
}
