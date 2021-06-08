import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ShoppingCartController extends GetxController {
  RxList<TextEditingController> listController = <TextEditingController>[].obs;
RxList<String>textFildValueList=<String>[].obs;
  RxList<bool> commendSelect = <bool>[].obs;
  RxList<bool> buttonCheck = <bool>[].obs;
}
