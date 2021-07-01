import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Clipper_Resturant_Photo.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/Widgets/search.dart';
import 'package:mjam/bottom_Navigation_bar/Shopping/shopping_Controller.dart';
import 'package:mjam/bottom_Navigation_bar/Shopping/shopping_carts.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'counterController.dart';
import '../info_resturant.dart';
import 'orderController.dart';

class PageResturant extends StatefulWidget {
  final Resturant resturant;

  PageResturant({Key key, this.resturant}) : super(key: key);

  @override
  _PageResturantState createState() => _PageResturantState(resturant);
}

class _PageResturantState extends State<PageResturant>
    with SingleTickerProviderStateMixin {
  final CounterController counterController = Get.put(CounterController());
  final OrderController orderController = Get.put(OrderController());
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());
  final Resturant resturant;

  _PageResturantState(this.resturant);

  RxBool likeBottumPress = false.obs;
  TabController tabController;
  RxString changeText = 'HINZUFÜGEN'.obs;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: resturant.products.length, vsync: this);
  }

  void updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFFFFF),
                  ),
                  child: IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_left,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Get.back();
                      }),
                ),
                Spacer(),
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFFFF),
                    ),
                    child: IconButton(
                      icon: Obx(
                        () => Icon(
                          likeBottumPress.value
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: primaryColor,
                        ),
                      ),
                      onPressed: () {
                        likeBottumPress.value = !likeBottumPress.value;
                      },
                    ),
                  ),
                ),
              ],
              elevation: 10,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).bottomAppBarTheme.color,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  children: <Widget>[
                    ClipPath(
                      child: Image.asset(
                        resturant.photoResturant,
                        height: 230.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      clipper: CliperHpmePageResturant(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            resturant.nameResturant,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.5,
                            style: Theme.of(context).primaryTextTheme.headline2,
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.info_circle,
                              size: 35,
                            ),
                            onPressed: () {
                              Get.to(InfoResturant(resturant: resturant));
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          rating(20.0, 105.0, 18.0,
                              Theme.of(context).bottomAppBarTheme.color),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            resturant.ratingResturant.toString(),
                            textAlign: TextAlign.left,
                            style: Theme.of(context).primaryTextTheme.headline3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            CupertinoIcons.timer,
                            size: 20,
                          ),
                          Text(
                            " ca.${resturant.deliveryDuration}min",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.headline3,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.location,
                            size: 20,
                          ),
                          Text(
                            "${(resturant.distance / 1000).toStringAsFixed(1)} km",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.headline3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Theme.of(context).backgroundColor,
                      child: Container(
                        color: whiteColor,
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: Search(),
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 420.0,
//========================================= TabBar =============================
              bottom: tabBar(context),
            ),
          ];
        },
//==================================== TabBarView ==============================

        body: TabBarView(
          controller: tabController,
          children: [
            for (int index = 0; index < resturant.products.length; index++)
              ListView(
                shrinkWrap: true,
                children: [
                  Card(
                    child: Container(
                        height: 100,
                        child: Image.asset(
                          resturant.photoResturant,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  for (Product product in resturant.product)
                    if (resturant.products[index].id == product.id)
                      Card(
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {
                              counterController.counter.value = 1;

                              showModalBottomSheet(
                                isScrollControlled: false,

                                enableDrag: false,
                                // backgroundColor: Colors.transparent,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0)),
                                ),
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
//==================================================================================== Product Name =======================
                                          productInfo(product, context),

//======================================================================== Allergene & Zusatzstoffe =======================
                                          allergeneAndZusatzstoffe(),
                                          Container(
                                            color: greyColor,
                                            width: double.infinity,
                                            height: 2,
                                          ),
//=================================================================================== Extraauflagen =======================
                                          extraauflagen(context),

                                          Container(
                                            color: greyColor,
                                            height: 2,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),

//============================================================================ Kommentare hinzufügen =======================
                                          comment(),
//========================================================================================= - and + =======================
                                          incrementAndDicrement(
                                              product, resturant),

//==================================================================================== HINZUFÜGEN =========================

                                          hinzufugen(product, context),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.nameProduct,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline2,
                                  ),
                                  Spacer(),
                                  Text(
                                    '\€ ' + product.price.toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline2,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    CupertinoIcons.plus_square,
                                    color: primaryColor,
                                    size: 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
          ],
        ),
      ),
      bottomSheet: counterController.showBottomSheet.value == true
          ? Container(
              height: 74,
              width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child: MaterialButton(
                color: primaryColor,
                onPressed: () {
                  counterController.itemCount.value = 1;
                  counterController.clear();

                  if (orderController.setMyCart.length != 0 &&
                      shoppingCartController.listController.length == 0) {
                    shoppingCartController.setTextFieldController(
                        orderController.setMyCart.length);
                  } else if (orderController.setMyCart.length >
                      shoppingCartController.listController.length) {
                    int result = orderController.setMyCart.length -
                        shoppingCartController.listController.length;
                    shoppingCartController.setTextFieldController(result);
                  } else {
                    print('Controller is Equal List Item!');
                  }

                  Get.to(() => ShoppingCarts());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Text(
                            orderController.cartOrder.isEmpty
                                // productBloc.cartOrder.isEmpty
                                ? ''
                                : orderController.cartOrder.length.toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .apply(color: primaryColor, fontSizeDelta: 5),
                          ),
                        ),
                      ),
                      Text(changeText.value,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button
                              .apply(color: whiteColor)),
                      Text(
                        orderController.cartOrder.isEmpty
                            ? ''
                            : orderController.cartOrder
                                .reduce((x, y) => Order(
                                    totalPrise: x.totalPrise + y.totalPrise))
                                .totalPrise
                                .toStringAsFixed(2),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .button
                            .apply(color: whiteColor, fontSizeDelta: 5),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }

  Expanded hinzufugen(Product product, BuildContext context) {
    return Expanded(
      flex: 1,
      child: MaterialButton(
        color: primaryColor,
        onPressed: () {
          if (orderController.cartOrder.isEmpty ||
              orderController.cartOrder[0].resturant.nameResturant ==
                  resturant.nameResturant) {
            counterController.showBottomSheet.value = true;
            counterController.itemCount.value >= 1
                ? changeText.value = 'WARENKORB ÖFFNEN'
                : changeText.value = 'HINZUFÜGEN';
            if (counterController.itemCount.value == 1) {
              orderController.addToCart(
                Order(
                  product: product,
                  totalPrise: product.price,
                  quantity: 1,
                  resturant: resturant,
                ),
              );

              counterController.clear();

              counterController.showBottomSheet.value = true;
              Get.back();
              updateScreen();
            } else {
              counterController.clear();
              counterController.counter.value = 1;
              Get.back();
              updateScreen();
            }
          } else {
            showDialogForCheckResturantHinzufugen(context, product);
            updateScreen();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.bag,
                color: whiteColor,
                size: 35,
              ),
              Obx(
                () => Text(
                  changeText.value,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button
                      .apply(color: whiteColor),
                ),
              ),
              Obx(
                () => Text(
                  (counterController.counter.value * product.price)
                      .toStringAsFixed(2),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button
                      .apply(color: whiteColor, fontSizeDelta: 5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDialogForCheckResturantHinzufugen(
      BuildContext context, Product product) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        title: Text(
          "Achtung!!",
          style: Theme.of(context)
              .primaryTextTheme
              .button
              .copyWith(color: primaryColor, fontSize: 14),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ihre aktuelle Bestellung wird gelöscht.",
              style: Theme.of(context)
                  .primaryTextTheme
                  .button
                  .copyWith(fontSize: 12),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  label: Text(
                    'JA',
                    style: Theme.of(context).primaryTextTheme.button,
                  ),
                  icon: Icon(
                    CupertinoIcons.checkmark_alt,
                    color: Color(0xFF10D401),
                  ),
                  onPressed: () {
                    orderController.clearAllCart();
                    counterController.showBottomSheet.value = true;
                    counterController.itemCount.value >= 1
                        ? changeText.value = 'WARENKORB ÖFFNEN'
                        : changeText.value = 'HINZUFÜGEN';
                    if (counterController.itemCount.value == 1) {
                      orderController.addToCart(
                        Order(
                          product: product,
                          totalPrise: product.price,
                          quantity: 1,
                          resturant: resturant,
                        ),
                      );

                      counterController.clear();

                      counterController.showBottomSheet.value = true;
                      Get.back();
                      updateScreen();
                    } else {
                      counterController.clear();
                      counterController.counter.value = 1;
                      Get.back();
                      updateScreen();
                    }
                    Get.back();
                  },
                ),
                Spacer(),
                ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  label: Text(
                    'NEIN',
                    style: Theme.of(context).primaryTextTheme.button,
                  ),
                  icon: Icon(
                    CupertinoIcons.clear,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDialogForCheckResturant(Product product) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        title: Text(
          "Achtung!!",
          style: Theme.of(context)
              .primaryTextTheme
              .button
              .copyWith(color: primaryColor, fontSize: 14),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ihre aktuelle Bestellung wird gelöscht.",
              style: Theme.of(context)
                  .primaryTextTheme
                  .button
                  .copyWith(fontSize: 12),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  label: Text(
                    'JA',
                    style: Theme.of(context).primaryTextTheme.button,
                  ),
                  icon: Icon(
                    CupertinoIcons.checkmark_alt,
                    color: Color(0xFF10D401),
                  ),
                  onPressed: () {
                    orderController.clearAllCart();
                    if (counterController.counter.value == 1) {
                      orderController.addToCart(
                        Order(
                          product: product,
                          totalPrise: product.price,
                          quantity: 1,
                          resturant: resturant,
                        ),
                      );

                      orderController.addToCart(
                        Order(
                          product: product,
                          totalPrise: product.price,
                          quantity: 1,
                          resturant: resturant,
                        ),
                      );
                      counterController.increment();
                    } else {
                      orderController.addToCart(
                        Order(
                          product: product,
                          totalPrise: product.price,
                          quantity: 1,
                          resturant: resturant,
                        ),
                      );
                      counterController.increment();
                    }
                    Get.back();
                  },
                ),
                Spacer(),
                ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  label: Text(
                    'NEIN',
                    style: Theme.of(context).primaryTextTheme.button,
                  ),
                  icon: Icon(
                    CupertinoIcons.clear,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded incrementAndDicrement(Product product, Resturant resturant) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Obx(
              () => Icon(
                CupertinoIcons.minus_circle,
                size: 40,
                color: counterController.counter.value > 1
                    ? primaryColor
                    : greyColor,
              ),
            ),
            onPressed: () {
              if (counterController.counter.value > 1) {
                counterController.decrement();
                orderController.removeFromCart(Order(
                  product: product,
                  totalPrise: product.price,
                  quantity: 1,
                  resturant: resturant,
                ));
              } else {
                counterController.counter.value;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Text(
                '${counterController.counter.value}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.add_circled,
              size: 40,
              color: primaryColor,
            ),
            onPressed: () {
              if (orderController.cartOrder.isEmpty ||
                  orderController.cartOrder[0].resturant.nameResturant ==
                      resturant.nameResturant) {
                if (counterController.counter.value == 1) {
                  orderController.addToCart(
                    Order(
                      product: product,
                      totalPrise: product.price,
                      quantity: 1,
                      resturant: resturant,
                    ),
                  );

                  orderController.addToCart(
                    Order(
                      product: product,
                      totalPrise: product.price,
                      quantity: 1,
                      resturant: resturant,
                    ),
                  );
                  counterController.increment();
                } else {
                  orderController.addToCart(
                    Order(
                      product: product,
                      totalPrise: product.price,
                      quantity: 1,
                      resturant: resturant,
                    ),
                  );
                  counterController.increment();
                }
              } else {
                showDialogForCheckResturant(product);
              }
            },
          ),
        ],
      ),
    );
  }

  Expanded comment() {
    return Expanded(
      flex: 1,
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              CupertinoIcons.bubble_right,
              size: 25,
              color: primaryColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Kommentar hinzufügen',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded extraauflagen(BuildContext context) {
    return Expanded(
      flex: 1,
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. Extraauflagen',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Optional',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
              ],
            ),
            Icon(
              CupertinoIcons.chevron_down,
              color: primaryColor,
              size: 30,
            )
          ],
        ),
      ),
    );
  }

  Expanded allergeneAndZusatzstoffe() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.info,
              color: primaryColor,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Allergene & Zusatzstoffe',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded productInfo(Product product, BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.nameProduct,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.clear_circled_solid,
                  ),
                  onPressed: () {
                    counterController.counter.value = 1;
                    Get.back();
                  },
                ),
              ],
            ),
            Text(
              'subTitle',
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }

  TabBar tabBar(BuildContext context) {
    return TabBar(
      labelStyle: Theme.of(context).tabBarTheme.labelStyle,
      isScrollable: true,
      indicatorColor: primaryColor,
      labelColor: Theme.of(context).tabBarTheme.labelColor,
      unselectedLabelColor:
          Theme.of(context).tabBarTheme.unselectedLabelColor.withOpacity(0.6),
      indicatorWeight: 4,
      unselectedLabelStyle: Theme.of(context).tabBarTheme.unselectedLabelStyle,
      tabs: [
        for (int i = 0; i < resturant.products.length; i++)
          Tab(text: resturant.products[i].nameProducts),
      ],
      controller: tabController,
    );
  }
}
