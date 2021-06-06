import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ShoppingCartController extends GetxController {
  RxList<TextEditingController> listController = <TextEditingController>[].obs;

  RxList<String> listTextController = <String>[].obs;
}
