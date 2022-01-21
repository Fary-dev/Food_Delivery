import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mjam/Sqlite/ExtraZutaten.dart';
import 'package:mjam/Sqlite/OrderModel.dart';

class ShoppingCartController extends GetxController {
  RxList<ExtraZutatenModel> selectedZutatenList = <ExtraZutatenModel>[].obs;
  RxBool zutatenCheck = false.obs;

  RxList<ExtraZutatenModel> extraZutatenList = <ExtraZutatenModel>[].obs;
  RxList<OrderModel> orderList = <OrderModel>[].obs;
  RxList<OrderModel> orderSet = <OrderModel>[].obs;
  RxList<TextEditingController> listController = <TextEditingController>[].obs;
  RxList<bool> commendSelect = <bool>[].obs;
  RxList<bool> buttonCheck = <bool>[].obs;
  RxList<ListOrderSet> setList = <ListOrderSet>[].obs;

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

  cleateSetList(
      List<OrderModel> orderList, List<ExtraZutatenModel> selectedZutatenList) {
    for (var a in orderList) {
      List<ZutatList> g = [];
      for (var s in selectedZutatenList) {
        if (s.orderId == a.id) {
          ZutatList zutatList = ZutatList(s.zutatenName, s.price);
          g.add(zutatList);
        }
      }
      if (setList.length < 1) {
        ListOrderSet listOrderSet = ListOrderSet(
            id: a.id,
            nameResturant: a.nameResturant,
            dateTime: a.dateTime,
            idProduct: a.idProduct,
            nameProduct: a.nameProduct,
            priceProduct: a.priceProduct,
            zutaten: g);
        setList.add(listOrderSet);
        print(' ERSTE:  ${setList.last.zutaten!.length} ${g.length}');
        g = [];
      } else {
        if (setList.last.nameProduct == a.nameProduct &&
            setList.last.nameResturant == a.nameResturant &&
            setList.last.zutaten != g) {
          ListOrderSet listOrderSet = ListOrderSet(
              id: a.id,
              nameResturant: a.nameResturant,
              dateTime: a.dateTime,
              idProduct: a.idProduct,
              nameProduct: a.nameProduct,
              priceProduct: a.priceProduct,
              zutaten: g);
          print('NICHT GLEISCH: ${a.nameProduct} ${a.id}');
          setList.add(listOrderSet);
          g = [];
        }
      }
      g = [];
    }
  }
}

class ZutatList {
  String name;
  double price;

  ZutatList(this.name, this.price);
}

class ListOrderSet {
  int? id;
  int idProduct;
  String nameResturant;
  String dateTime;
  String nameProduct;
  double priceProduct;
  List<ZutatList>? zutaten;

  ListOrderSet({
    this.id,
    required this.nameResturant,
    required this.dateTime,
    required this.idProduct,
    required this.nameProduct,
    required this.priceProduct,
    required this.zutaten,
  });
}
