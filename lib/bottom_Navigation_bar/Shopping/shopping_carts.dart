import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Home_Page/HomePage.dart';
import 'package:mjam/Screens/Resturants/PageResturant/counterController.dart';
import 'package:mjam/Screens/Resturants/PageResturant/orderController.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';
import 'package:mjam/bottom_Navigation_bar/Shopping/shopping_Controller.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';


class ShoppingCarts extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());
  final OrderController orderController = Get.put(OrderController());
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Obx(
          () => orderController.cartOrder.isNotEmpty
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
                    orderController.cartOrder.length > 0
                        ? 'Deine Bestellung bei ${orderController.cartOrder[0].resturant!.nameResturant}'
                        : '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GetBuilder<OrderController>(builder: (_ord) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _ord.setMyCart.length,
                  itemBuilder: (context, index) {
                    var _order = _ord.setMyCart.elementAt(index);
                    int count = _ord.cartOrder
                        .where((element) => element.product == _order)
                        .toList()
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
                                        orderController.removeFromCart(Order(
                                          product: _order,
                                          totalPrise: _order.price,
                                          quantity: 1,
                                          resturant:
                                              _ord.cartOrder[0].resturant,
                                        ));
                                      } else if (_ord.cartOrder.length == 1) {
                                        _ord.clearAllCart();
                                        counterController.itemCount.value = 1;
                                        counterController
                                            .showBottomSheet.value = false;
                                      } else {
                                        orderController.removeFromCart(Order(
                                          product: _order,
                                          totalPrise: _order.price,
                                          quantity: 1,
                                          resturant:
                                              _ord.cartOrder[0].resturant,
                                        ));

                                        _ord.setMyCart.remove(_order);
                                        shoppingCartController
                                            .revomeController(index);
                                      }
                                      if (_ord.setMyCart.isEmpty) {
                                        _ord.clearAllCart();

                                        counterController.itemCount.value = 1;
                                        counterController
                                            .showBottomSheet.value = false;
                                        orderController.clearAllCart();
                                      }

                                    },
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    transitionBuilder: (Widget child, Animation<double> animation) {
                                      return ScaleTransition(child: child, scale: animation);
                                    },
                                  child:Text(
                                    count.toString(),
                                    key: ValueKey<int>(count) ,
                                  ),),
                                  IconButton(
                                    icon: Icon(
                                      CupertinoIcons.add,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                    onPressed: () {
                                      _ord.addToCart(Order(
                                          totalPrise: _order.price,
                                          quantity: 1,
                                          product: _order,
                                          resturant: orderController
                                              .cartOrder[index].resturant));
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
                                          '\€ ${(count * _order.price!).toStringAsFixed(2)}',
                                        )
                                      ],
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 0.0),
                                        child: Text('+ Zutaten',
                                            style:
                                                TextStyle(color: greyColor))),
                                    Obx(
                                      () => shoppingCartController
                                                  .commendSelect[index] ==
                                              false
                                          ? Container(
                                              padding:
                                                  EdgeInsets.only(left: 0.0),
                                              child: SizedBox(
                                                height: 32,
                                                child: TextButton(
                                                    onPressed: () {
                                                      shoppingCartController
                                                              .commendSelect[
                                                          index] = true;
                                                      shoppingCartController
                                                              .buttonCheck[
                                                          index] = false;
                                                    },
                                                    child: Text(
                                                      'Kommentar hinzufügen',
                                                      style: TextStyle(
                                                          color: primaryColor),
                                                    )),
                                              ))
                                          : Container(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Obx(
                            () => shoppingCartController.commendSelect[index] ==
                                        true ||
                                    shoppingCartController
                                            .listController[index].text !=
                                        ''
                                ? SizedBox(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: TextFormField(
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
                                                        .commendSelect[index] =
                                                    true;
                                              } else {
                                                shoppingCartController
                                                        .commendSelect[index] =
                                                    false;
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
                                                    : 'Hinzufügen'
                                                        .toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            color: shoppingCartController
                                                            .listController[
                                                                index]
                                                            .text !=
                                                        '' &&
                                                    shoppingCartController
                                                                .buttonCheck[
                                                            index] ==
                                                        true
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(''),
                          )
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: orderController.cartOrder.length == 0
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
                              Text(
                                '${orderController.cartOrder.reduce((x, y) => Order(totalPrise: x.totalPrise! + y.totalPrise!)).totalPrise!.toStringAsFixed(2)} \€',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 18),
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
                                        fontSize: 14, color: Color(0xFFFFFFFF)),
                              ),
                              onPressed: () {
                                Get.off(() => HomePage());
                              },
                            ),
                          )
                        ],
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
            style:
                Theme.of(context).textTheme.headline3!.apply(fontSizeDelta: -30),
          ),
          SizedBox(
            height: 240,
          ),
          TextButton(
            onPressed: () {
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
        () => orderController.cartOrder.length != 0
            ? IconButton(
                icon: Icon(
                  CupertinoIcons.arrow_left,
                  color: primaryColor,
                ),
                onPressed: () {
                  Get.back();
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
          () => orderController.cartOrder.length != 0
              ? IconButton(
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    orderController.clearAllCart();
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
