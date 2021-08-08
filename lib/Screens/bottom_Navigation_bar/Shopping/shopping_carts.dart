import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Home_Page/HomePage.dart';
import 'package:mjam/Screens/Resturants/PageResturant/counterController.dart';
import 'package:mjam/Screens/BootomNavBar/BottomNavBarWidget.dart';
import 'package:mjam/Screens/Resturants/PageResturant/pageResturant.dart';
import 'package:mjam/Screens/bottom_Navigation_bar/Shopping/shopping_Controller.dart';
import 'package:mjam/Sqlite/Database.dart';
import 'package:mjam/Sqlite/OrderModel.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class ShoppingCarts extends StatefulWidget {
  @override
  State<ShoppingCarts> createState() => _ShoppingCartsState();
}

class _ShoppingCartsState extends State<ShoppingCarts> {
  final CounterController counterController = Get.put(CounterController());

  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());

  @override
  void initState() {
    super.initState();
    _refreshDataOrderList();
  }

  _addToOrderList(OrderModel ord) async {
    OrderModel order = OrderModel(
      idProduct: ord.idProduct,
      nameResturant: '${ord.nameResturant}',
      nameProduct: '${ord.nameProduct}',
      priceProduct: ord.priceProduct,
      dateTime: '${DateTime.now()}',
    );
    await DB.insertToOrderCard(order);
    order.id1 = shoppingCartController.orderList.isEmpty
        ? 0
        : shoppingCartController
                .orderList[shoppingCartController.orderList.length - 1].id1! +
            1;
    _refreshDataOrderList();
  }

  _removeFromOrderList(OrderModel ord) async {
    for (var s in shoppingCartController.orderList) {
      if (s.nameProduct == ord.nameProduct && s.idProduct == ord.idProduct) {
        await DB.deleteFromOrderCard(s.id1!);
      }
    }
    _refreshDataOrderList();
  }

  _refreshDataOrderList() async {
    final data = await DB.getDataOrderCard();
    shoppingCartController.orderList.value = data;
    _refreshSetList();
  }

  _removeAllDataFromOrderList() async {
    await DB.deleteAllDataFromOrderList();
    shoppingCartController.orderList.value = [];
    _refreshDataOrderList();
  }

  _refreshSetList() {
    shoppingCartController.orderSet.clear();

    final Map<String, OrderModel> profileMap = new Map();
    shoppingCartController.orderList.forEach((item) {
      profileMap[item.nameProduct!] = item;
    });
    shoppingCartController.orderSet.value = profileMap.values.toList();
    shoppingCartController
        .setTextFieldController(shoppingCartController.orderSet.length);

    // if (shoppingCartController.orderSet.length != 0 &&
    //     shoppingCartController.listController.length == 0) {
    //   shoppingCartController
    //       .setTextFieldController(shoppingCartController.orderSet.length);
    // }
    //
    // if (shoppingCartController.orderSet.length >
    //     shoppingCartController.listController.length) {
    //   int result = shoppingCartController.orderSet.length -
    //       shoppingCartController.listController.length;
    //   shoppingCartController.setTextFieldController(result);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Obx(
          () => shoppingCartController.orderList.isNotEmpty
              ? screenAfterLogIn(context)
              : screenBeforLogIn(context),
        ),
      ),
    );
  }

  Column screenAfterLogIn(context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    shoppingCartController.orderList.length > 0
                        ? 'Deine Bestellung bei ${shoppingCartController.orderList[0].nameResturant}'
                        : '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GetBuilder< /*OrderController*/ ShoppingCartController>(
                  builder: (_ord) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: /*_ord.setMyCart.length,*/ _ord.orderSet.length,
                  itemBuilder: (context, index) {
                    var _order = /*_ord.setMyCart.elementAt(index);*/ _ord
                        .orderSet
                        .elementAt(index);
                    int
                        count = /*_ord.cartOrder
                        .where((element) => element.product == _order)
                        .toList()
                        .length;*/
                        _ord.orderList
                            .where((a) => a.nameProduct == _order.nameProduct)
                            .length;

                    return Container(
                      padding: EdgeInsets.only(right: 10.0),
                      width: MediaQuery.of(context).size.width - 30,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      CupertinoIcons.minus,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                    onPressed: () {
                                      if (count > 1) {
                                        _removeFromOrderList(_order);
                                        // orderController.removeFromCart(Order(
                                        //   product: _order,
                                        //   totalPrise: _order.price,
                                        //   quantity: 1,
                                        //   resturant:
                                        //       _ord.cartOrder[0].resturant,
                                        // ));
                                      } else if (_ord.orderList.length == 1) {
                                        // _ord.clearAllCart();
                                        _removeAllDataFromOrderList();
                                        counterController.itemCount.value = 1;
                                        counterController
                                            .showBottomSheet.value = false;
                                      } else {
                                        _removeFromOrderList(_order);
                                        // orderController.removeFromCart(Order(
                                        //   product: _order,
                                        //   totalPrise: _order.price,
                                        //   quantity: 1,
                                        //   resturant:
                                        //       _ord.cartOrder[0].resturant,
                                        // ));

                                        // _ord.setMyCart.remove(_order);
                                        _ord.revomeController(index);
                                      }
                                      // if (_ord.setMyCart.isEmpty) {
                                      //   _ord.clearAllCart();
                                      //
                                      //   counterController.itemCount.value = 1;
                                      //   counterController
                                      //       .showBottomSheet.value = false;
                                      //   orderController.clearAllCart();
                                      // }
                                    },
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return ScaleTransition(
                                          child: child, scale: animation);
                                    },
                                    child: Text(
                                      count.toString(),
                                      key: ValueKey<int>(count),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      CupertinoIcons.add,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                    onPressed: () {
                                      _addToOrderList(_order);
                                      // _ord.addToCart(Order(
                                      //     totalPrise: _order.price,
                                      //     quantity: 1,
                                      //     product: _order,
                                      //     resturant: orderController
                                      //         .cartOrder[index].resturant));
                                    },
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _order.nameProduct!,
                                        ),
                                        Text(
                                          '\€ ${(count * _order.priceProduct!).toStringAsFixed(2)}',
                                        )
                                      ],
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 0.0),
                                        child: Text('+ Zutaten',
                                            style:
                                                TextStyle(color: greyColor))),
                                    !(_ord.commendSelect[index])
                                        ? Container(
                                            padding: EdgeInsets.only(left: 0.0),
                                            child: SizedBox(
                                              height: 32,
                                              child: TextButton(
                                                  onPressed: () {
                                                    _ord.commendSelect[index] =
                                                        true;
                                                    _ord.buttonCheck[index] =
                                                        false;
                                                  },
                                                  child: Text(
                                                    'Kommentar hinzufügen',
                                                    style: TextStyle(
                                                        color: primaryColor),
                                                  )),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              )
                            ],
                          ),
                          (_ord.commendSelect[index] == true ||
                                  _ord.listController[index].text != '')
                              ? SizedBox(
                                  height: 35,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Obx(
                                            () => TextFormField(
                                              textAlignVertical:
                                                  TextAlignVertical.bottom,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline3!
                                                  .copyWith(fontSize: 14),
                                              controller: shoppingCartController
                                                  .listController[index],
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                hintText: 'Kommentare..',
                                              ),
                                              onSaved: (value) {
                                                if (value != '') {
                                                  shoppingCartController
                                                      .listController[index]
                                                      .text = value!;
                                                }
                                              },
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => MaterialButton(
                                          padding: EdgeInsets.all(5),
                                          onPressed: () {
                                            if (shoppingCartController
                                                        .listController[index]
                                                        .text !=
                                                    '' &&
                                                shoppingCartController
                                                        .buttonCheck[index] ==
                                                    false) {
                                              shoppingCartController
                                                  .buttonCheck[index] = true;
                                              shoppingCartController
                                                  .commendSelect[index] = true;
                                            } else {
                                              shoppingCartController
                                                  .commendSelect[index] = false;
                                              shoppingCartController
                                                  .listController[index]
                                                  .text = '';
                                            }
                                          },
                                          child: Obx(
                                            () => Text(
                                              shoppingCartController
                                                              .listController[
                                                                  index]
                                                              .text !=
                                                          '' &&
                                                      shoppingCartController
                                                                  .buttonCheck[
                                                              index] ==
                                                          true
                                                  ? 'Entfernen'.toUpperCase()
                                                  : 'Hinzufügen'.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          color: shoppingCartController
                                                          .listController[index]
                                                          .text !=
                                                      '' &&
                                                  shoppingCartController
                                                          .buttonCheck[index] ==
                                                      true
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Text(''),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Container(
                  child: shoppingCartController.orderList.length == 0
                      ? Text('')
                      : Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Gesamt',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline2!
                                            .copyWith(fontSize: 18)),
                                    TextSpan(text: ' '),
                                    TextSpan(
                                      text: '(inkl.Mwst.)',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ]),
                                ),
                                Spacer(),
                                Obx(
                                  () => Text(
                                    // '${orderController.cartOrder.reduce((x, y) => Order(totalPrise: x.totalPrise! + y.totalPrise!)).totalPrise!.toStringAsFixed(2)} \€',
                                    '${shoppingCartController.orderList.reduce((x, y) => OrderModel(priceProduct: x.priceProduct! + y.priceProduct!)).priceProduct!.toStringAsFixed(2)} €',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  primary: primaryColor,
                                  textStyle:
                                      Theme.of(context).primaryTextTheme.button,
                                ),
                                child: Text(
                                  "Zahlung und Adresse Überprüfen",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button!
                                      .copyWith(
                                          fontSize: 14,
                                          color: Color(0xFFFFFFFF)),
                                ),
                                onPressed: () {
                                  Get.off(() => HomePage());
                                },
                              ),
                            )
                          ],
                        ),
                ),
              ),
            )
          ],
        )),
      ],
    );
  }

  Center screenBeforLogIn(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 80,
            child: ColorFiltered(
              child: Image.asset(
                "assets/korb.png",
                fit: BoxFit.fitWidth,
              ),
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Bitte lege etwas in den Warenkörb.',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .apply(fontSizeDelta: -30),
          ),
          SizedBox(
            height: 240,
          ),
          TextButton(
            onPressed: () {
              // selectedIndex.index.value=0;
              Get.to(() => BottomNavBarWidget());
            },
            child: Text(
              "Zur Resturantliste",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .apply(color: primaryColor, fontSizeDelta: 1),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: Obx(
        () => shoppingCartController.orderList.length != 0
            ? IconButton(
                icon: Icon(
                  CupertinoIcons.arrow_left,
                  color: primaryColor,
                ),
                onPressed: () {
                  Resturant? res;
                  for (var a in resturants) {
                    if (a.nameResturant ==
                        shoppingCartController.orderList[0].nameResturant) {
                      res = a;
                    }
                  }
                  Get.to(() => PageResturant(
                        resturant: res,
                      ));
                },
              )
            : Icon(
                CupertinoIcons.arrow_left,
                color: Colors.transparent,
              ),
      ),
      title: Text(
        "Deine Warenkörbe",
        style: Theme.of(context).primaryTextTheme.button,
      ),
      actions: [
        Obx(
          () => shoppingCartController.orderList.length != 0
              ? IconButton(
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    // orderController.clearAllCart();
                    _removeAllDataFromOrderList();
                    counterController.itemCount.value = 1;
                    counterController.showBottomSheet.value = false;
                    shoppingCartController.commendSelect.clear();
                    shoppingCartController.buttonCheck.clear();
                    shoppingCartController.listController.clear();
                  },
                )
              : IconButton(
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: greyColor,
                  ),
                  onPressed: null,
                ),
        ),
      ],
    );
  }
}
