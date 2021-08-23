import 'package:get/get.dart';
import 'package:mjam/Screens/BootomNavBar/BottomNavBarWidget.dart';
import 'package:mjam/Screens/BootomNavBar/bottom_Navigation_bar/Shopping/shopping_Controller.dart';
import 'package:mjam/Screens/BootomNavBar/bottom_Navigation_bar/Shopping/shopping_carts.dart';
import 'package:mjam/Sqlite/Database.dart';
import 'package:mjam/Sqlite/FavoriteModel.dart';
import 'package:mjam/Sqlite/OrderModel.dart';
import 'package:mjam/Screens/Resturants/PageResturant/NewScreen/resInfoHeader.dart';
import 'package:mjam/Screens/Resturants/PageResturant/NewScreen/pageHeader.dart';
import 'package:mjam/Screens/Resturants/PageResturant/NewScreen/sliverPersistentHeaderDelegateTabBar.dart';
import '../FavoritController.dart';
import '../counterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class PageResturant extends StatefulWidget {
  final Resturant? resturant;

  PageResturant({Key? key, this.resturant}) : super(key: key);

  @override
  _PageResturantState createState() => _PageResturantState(resturant);
}

class _PageResturantState extends State<PageResturant>
    with SingleTickerProviderStateMixin {
  final Resturant? resturant;

  _PageResturantState(this.resturant);

  final CounterController counterController = Get.put(CounterController());
  final FavoriteController favoritController = Get.put(FavoriteController());

  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());

  TabController? tabController;
  RxBool check = false.obs;

  @override
  void initState() {
    tabController =
        TabController(length: resturant!.products!.length, vsync: this);
    _refreshDataFavoriteList();
    _refreshDataOrderList();
    super.initState();
  }

  _refreshDataFavoriteList() async {
    final data = await DB.getDataFavoriteList();
    favoritController.favoriteList.value = data;
  }

  _addToFavoriteList(Resturant res) async {
    FavoriteModel favoriteModel = FavoriteModel(
      name: '${res.nameResturant}',
      owner: '${res.owner}',
    );
    await DB.insertToFavoriteList(favoriteModel);
    favoriteModel.id = favoritController.favoriteList.isEmpty
        ? 0
        : favoritController
                .favoriteList[favoritController.favoriteList.length - 1].id! +
            1;

    _refreshDataFavoriteList();
  }

  _removeFromFavoriteList(Resturant res) async {
    for (var a in favoritController.favoriteList) {
      if (a.name == res.nameResturant && a.owner == res.owner) {
        await DB.deleteFromFavoriteList(a.id!);
      }
    }
    _refreshDataFavoriteList();
  }

  _addToOrderList(Resturant res, Product pro) async {
    OrderModel order = OrderModel(
      idProduct: pro.id,
      nameResturant: '${res.nameResturant}',
      nameProduct: '${pro.nameProduct}',
      priceProduct: pro.price,
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

  _removeFromOrderList(Product pro) async {
    final s = shoppingCartController.orderList
        .firstWhere((element) => element.nameProduct == pro.nameProduct)
        .id1;
    await DB.deleteFromOrderCard(s!);

    _refreshDataOrderList();
  }

  _refreshDataOrderList() async {
    final data = await DB.getDataOrderCard();
    shoppingCartController.orderList.value = data;
  }

  _removeAllDataFromOrderList() async {
    await DB.deleteAllDataFromOrderList();
    shoppingCartController.orderList.value = [];
    _refreshDataOrderList();
    shoppingCartController.orderSet.clear();
  }

  void updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                delegate: TestPageHeader(resturant!),
                floating: false,
                pinned: true,
              ),
              SliverPersistentHeader(
                delegate: TestPageHeaderInfo(resturant!),
                floating: false,
                pinned: true,
              ),
              SliverPersistentHeader(
                delegate: SliverPersistentHeaderDelegateTabBar(
                  TabBar(
                    labelStyle: Theme.of(context).tabBarTheme.labelStyle,
                    isScrollable: true,
                    indicatorColor: primaryColor,
                    labelColor: Theme.of(context).tabBarTheme.labelColor,
                    unselectedLabelColor: Theme.of(context)
                        .tabBarTheme
                        .unselectedLabelColor!
                        .withOpacity(0.9),
                    indicatorWeight: 4,
                    unselectedLabelStyle:
                        Theme.of(context).tabBarTheme.unselectedLabelStyle,
                    tabs: [
                      for (int i = 0; i < resturant!.products!.length; i++)
                        Tab(text: resturant!.products![i].nameProducts),
                    ],
                    controller: tabController,
                  ),
                ),
                pinned: true,
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    for (int index = 0;
                        index < resturant!.products!.length;
                        index++)
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                resturant!.photoResturant!,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            for (Product product in resturant!.product!)
                              if (resturant!.products![index].id == product.id)
                                Card(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    height: 40,
                                    child: MaterialButton(
                                      onPressed: () {
                                        counterController.counter.value = 1;

                                        showModalBottomSheet(
                                          isScrollControlled: false,
                                          enableDrag: false,
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight:
                                                    Radius.circular(10.0)),
                                          ),
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
//==================================================================================== Product Name =======================
                                                    productInfo(
                                                        product, context),
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
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    ),
//============================================================================ Kommentare hinzufügen =======================
                                                    comment(),
//====================================================================  - and +   HINZUFÜGEN ================================
                                                    hinzufugen(resturant!,
                                                        product, context),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              product.nameProduct!,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2,
                                            ),
                                            Spacer(),
                                            Text(
                                              '€ ${product.price!.toStringAsFixed(2)}',
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2,
                                            ),
                                            SizedBox(width: 10),
                                            Icon(
                                              CupertinoIcons.plus_square,
                                              color: primaryColor,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],

//==================================== TabBarView ==============================
          ),
          Positioned(
            top: 7.5,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              height: 41,
              width: 41,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Get.to(() => BottomNavBarWidget());

                  }),
            ),
          ),
          Positioned(
            top: 7.5,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              child: Container(
                margin: EdgeInsets.only(right: 15),
                height: 41,
                width: 41,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  icon: Obx(
                    () => Icon(
                      (favoritController.favoriteList.any((e) =>
                                  (e.name) == resturant!.nameResturant)) ==
                              true
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: primaryColor,
                    ),
                  ),
                  onPressed: () {
                    (favoritController.favoriteList.any((e) =>
                                (e.name) == resturant!.nameResturant!)) ==
                            true
                        ? _removeFromFavoriteList(resturant!)
                        : _addToFavoriteList(resturant!);
                  },
                ),
              ),
            ),
          ),
        ]),
        bottomSheet: Container(
            color: Theme.of(context).primaryColor,
            child: counterController.showBottomSheet.value == true ||
                    shoppingCartController.orderList.isNotEmpty
                ? Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: primaryColor,
                            textStyle:
                                Theme.of(context).primaryTextTheme.button,
                          ),
                          onPressed: () {
                            counterController.itemCount.value = 1;
                            counterController.clear();
                            shoppingCartController.orderSet.clear();
                            final Map<String, OrderModel> profileMap =
                                new Map();
                            shoppingCartController.orderList.forEach((item) {
                              profileMap[item.nameProduct!] = item;
                            });
                            shoppingCartController.orderSet.value =
                                profileMap.values.toList();

                            shoppingCartController.setTextFieldController(
                                shoppingCartController.orderSet.length);

                            // if(shoppingCartController.orderSet.length!=0&& shoppingCartController.listController.length == 0){
                            //   shoppingCartController.setTextFieldController(shoppingCartController.orderSet.length);
                            // }
                            //
                            // if(shoppingCartController.orderSet.length>shoppingCartController.listController.length){
                            //   int result=shoppingCartController.orderSet.length-shoppingCartController.listController.length;
                            //   shoppingCartController.setTextFieldController(result);
                            // }
                            Get.to(() => ShoppingCarts());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                ),
                                child: Center(
                                  child: Obx(
                                    () => Text(
                                      shoppingCartController.orderList.isEmpty
                                          ? ''
                                          : '${shoppingCartController.orderList.length}',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .button!
                                          .apply(
                                              color: primaryColor,
                                              fontSizeDelta: 2),
                                    ),
                                  ),
                                ),
                              ),
                              Text('WARENKORB ÖFFNEN',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button!
                                      .apply(color: whiteColor)),
                              Obx(
                                () => Text(
                                  shoppingCartController.orderList.isEmpty
                                      ? ''
                                      : '${shoppingCartController.orderList.reduce((x, y) => OrderModel(priceProduct: x.priceProduct! + y.priceProduct!)).priceProduct!.toStringAsFixed(2)} €',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button!
                                      .apply(
                                          color: whiteColor, fontSizeDelta: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Text('')),
      ),
    );
  }

  hinzufugen(Resturant resturant, Product product, BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Obx(
                  () => Icon(
                    CupertinoIcons.minus_circle_fill,
                    size: 30,
                    color: counterController.counter.value > 1
                        ? primaryColor
                        : greyColor,
                  ),
                ),
                onPressed: () {
                  if (counterController.counter.value > 1) {
                    counterController.decrement();
                    _removeFromOrderList(product);
                  } else {
                    counterController.counter.value;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => Text(
                    '${counterController.counter.value}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  size: 30,
                  color: primaryColor,
                ),
                onPressed: () {
                  if (shoppingCartController.orderList.isEmpty ||
                      shoppingCartController.orderList[0].nameResturant ==
                          resturant.nameResturant) {
                    if (counterController.counter.value == 1) {
                      _addToOrderList(resturant, product);
                      _addToOrderList(resturant, product);

                      counterController.increment();
                    } else {
                      _addToOrderList(resturant, product);

                      counterController.increment();
                    }
                  } else {
                    showDialogForCheckResturant(resturant, product);
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: primaryColor,
                        textStyle: Theme.of(context).primaryTextTheme.button,
                      ),
                      onPressed: () {
                        if (shoppingCartController.orderList.isEmpty ||
                            shoppingCartController.orderList[0].nameResturant ==
                                resturant.nameResturant) {
                          counterController.showBottomSheet.value = true;
                          if (counterController.itemCount.value == 1) {
                            _addToOrderList(resturant, product);

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
                          showDialogForCheckResturantHinzufugen(
                              context, resturant, product);
                          updateScreen();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Icon(
                          //   CupertinoIcons.bag,
                          //   color: whiteColor,
                          //   size: 25,
                          // ),
                          Text(
                            'HINZUFÜGEN',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .button!
                                .apply(color: whiteColor),
                          ),

                          Obx(
                            () => Text(
                              (counterController.counter.value * product.price!)
                                  .toStringAsFixed(2),
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .button!
                                  .apply(color: whiteColor, fontSizeDelta: 4),
                            ),
                          ),
                        ],
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDialogForCheckResturantHinzufugen(
      BuildContext context, Resturant resturant, Product product) {
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
              .button!
              .copyWith(color: primaryColor, fontSize: 14),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ihre aktuelle Bestellung wird gelöscht.",
              style: Theme.of(context)
                  .primaryTextTheme
                  .button!
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
                    _removeAllDataFromOrderList();
                    counterController.showBottomSheet.value = true;

                    if (counterController.itemCount.value == 1) {
                      _addToOrderList(resturant, product);

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

  Future<dynamic> showDialogForCheckResturant(
      Resturant resturant, Product product) {
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
              .button!
              .copyWith(color: primaryColor, fontSize: 14),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ihre aktuelle Bestellung wird gelöscht.",
              style: Theme.of(context)
                  .primaryTextTheme
                  .button!
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
                    _removeAllDataFromOrderList();

                    if (counterController.counter.value == 1) {
                      _addToOrderList(resturant, product);
                      _addToOrderList(resturant, product);

                      counterController.increment();
                    } else {
                      _addToOrderList(resturant, product);

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
                  product.nameProduct!,
                  style: TextStyle(
                    fontSize: 25,
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
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1!
                  .copyWith(fontSize: 20),
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
          Theme.of(context).tabBarTheme.unselectedLabelColor!.withOpacity(0.6),
      indicatorWeight: 4,
      unselectedLabelStyle: Theme.of(context).tabBarTheme.unselectedLabelStyle,
      tabs: [
        for (int i = 0; i < resturant!.products!.length; i++)
          Tab(text: resturant!.products![i].nameProducts),
      ],
      controller: tabController,
    );
  }
}
