import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mjam/Screens/BootomNavBar/BottomNavBarWidget.dart';
import 'package:mjam/Screens/BootomNavBar/bottom_Navigation_bar/Shopping/shopping_Controller.dart';
import 'package:mjam/Screens/BootomNavBar/bottom_Navigation_bar/Shopping/shopping_carts.dart';
import 'package:mjam/Screens/Resturants/PageResturant/NewScreen/ShowNotificationOfProduct.dart';
import 'package:mjam/Sqlite/Database.dart';
import 'package:mjam/Sqlite/ExtraZutaten.dart';
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

  RxInt showTheProductInShoppingCard = 0.obs;

  final CounterController counterController = Get.put(CounterController());
  final FavoriteController favoritController = Get.put(FavoriteController());
  final NotificationOfProduct notificationOfProduct =
      Get.put(NotificationOfProduct());

  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());

  final scrollController = ScrollController();
  TabController? tabController;
  RxBool check = false.obs;

  @override
  void initState() {
    tabController =
        TabController(length: resturant!.products!.length, vsync: this);
    _refreshDataFavoriteList();
    _refreshDataOrderList();
    _refreshDataExtraZutaten();
    super.initState();
  }

  _refreshDataExtraZutaten() async {
    final data = await DB.getDataExtraZutaten();
    shoppingCartController.extraZutatenList.value = data;
  }

  _addToExtraZutatenList(
      Extra extra, Product product, Resturant resturant) async {
    ExtraZutatenModel extraZutatenModel = ExtraZutatenModel(
      idProduct: product.id,
      nameProduct: product.nameProduct,
      nameResturant: resturant.nameResturant,
      dateTime: DateTime.now().toString(),
      zutatenName: extra.name,
      price: extra.price,
    );
    await DB.insertToExtraZutatenList(extraZutatenModel);
    extraZutatenModel.id = shoppingCartController.extraZutatenList.isEmpty
        ? 0
        : shoppingCartController
                .extraZutatenList[
                    shoppingCartController.extraZutatenList.length - 1]
                .id! +
            1;

    _refreshDataExtraZutaten();
  }

  _removeFromExtraZutatenList(Extra extra, Resturant resturant) async {
    for (var a in shoppingCartController.extraZutatenList) {
      for (var t in resturant.extra!) {
        if (a.zutatenName == extra.name &&
            a.nameResturant == resturant.nameResturant &&
            extra.name == t.name) {
          await DB.deleteFromExtraZutatenList(a.id!);
        }
      }
    }
    _refreshDataExtraZutaten();
  }

  _removeAllDataFromzutatenList() async {
    await DB.deleteAllDataFromExtraZutatenList();
    shoppingCartController.extraZutatenList.value = [];
    _refreshDataExtraZutaten();
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
    _refreshDataOrderList();
    updateScreen();
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
                    controller: tabController,
                    labelStyle: Theme.of(context).tabBarTheme.labelStyle,
                    isScrollable: true,
                    physics: BouncingScrollPhysics(),
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
                        Tab(text: resturant!.products![i].nameProductType),
                    ],
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
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  resturant!.products![index].nameProductType ==
                                          resturant!
                                              .products![0].nameProductType!
                                      ? ImageIcon(
                                          AssetImage("assets/flame.png"),
                                          color: primaryColor,
                                          size: 15,
                                        )
                                      : Container(),
                                  Text(
                                    resturant!
                                        .products![index].nameProductType!,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .button!
                                        .copyWith(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            resturant!.products![index].nameProductType ==
                                    resturant!.products![0].nameProductType!
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, bottom: 12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Aktuell amhäufigsten bestell',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline3!
                                              .copyWith(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            for (Product product in resturant!.product!)
                              if (resturant!.products![index].nameProductType ==
                                  product.productType!.nameProductType)
                                InkWell(
                                  onTap: () {
                                    counterController.counter.value = 1;
                                    print(shoppingCartController
                                        .extraZutatenList.length);
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(18.0),
                                              topRight: Radius.circular(18.0)),
                                        ),
                                        builder: (BuildContext context) =>
                                            StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter
                                                      setStateOfBottomSheet) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: ListView(
                                                    controller:
                                                        scrollController,
                                                    shrinkWrap: true,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(
                                                                    context)
                                                                .cardColor,
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            18))),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Center(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            height: 5,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff000000),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0,
                                                      ),
                                                      productInfo(
                                                          product, context),
                                                      product.extra != null
                                                          ? Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          15),
                                                                  child:
                                                                      Divider(
                                                                    height: 1,
                                                                  ),
                                                                ),
                                                                extraauflagen(
                                                                    resturant!,
                                                                    product,
                                                                    context,
                                                                    setStateOfBottomSheet),
                                                              ],
                                                            )
                                                          : Container(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          height: 1,
                                                        ),
                                                      ),
                                                      comment(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          height: 1,
                                                        ),
                                                      ),
                                                      hinzufugen(
                                                          resturant!,
                                                          product,
                                                          context,
                                                          setStateOfBottomSheet),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Obx(
                                      () => Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(height: 10),
                                              Text(
                                                '${product.nameProduct}',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .button!
                                                    .copyWith(fontSize: 13),
                                              ),
                                              product.subtitle != ''
                                                  ? Column(
                                                      children: [
                                                        SizedBox(height: 10),
                                                        Text(
                                                          '${product.subtitle}',
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: Theme.of(
                                                                  context)
                                                              .primaryTextTheme
                                                              .subtitle1!
                                                              .copyWith(
                                                                  fontSize: 10),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${product.price!.toStringAsFixed(2)}  \€',
                                                    style: Theme.of(context)
                                                        .primaryTextTheme
                                                        .headline3,
                                                  ),
                                                  Spacer(),
                                                  IconButton(
                                                      onPressed: () {
                                                        updateScreen();
                                                      },
                                                      icon: Icon(
                                                          CupertinoIcons.info)),
                                                ],
                                              ),
                                              Divider(
                                                height: 2,
                                              ),
                                            ],
                                          ),
                                          notificationOfProduct.checker(
                                                      product,
                                                      resturant!,
                                                      shoppingCartController
                                                          .orderList) ==
                                                  true
                                              ? Positioned(
                                                  top: 10,
                                                  right: 15,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: primaryColor,
                                                      ),
                                                      height: 20,
                                                      width: 20,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          '${notificationOfProduct.showContainerCounterOfProduct(product, resturant!, shoppingCartController.orderList)}',
                                                          style: Theme.of(
                                                                  context)
                                                              .primaryTextTheme
                                                              .button!
                                                              .copyWith(
                                                                  color: Color(
                                                                      0xffffffff),
                                                                  fontSize: 10))
                                                      // showContainerCounterOfProduct(product,resturant!,shoppingCartController.orderList),
                                                      ),
                                                )
                                              : Container(),
                                        ],
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

  hinzufugen(Resturant resturant, Product product, BuildContext context,
      StateSetter setStateOfBottomSheet) {
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
                  updateScreen();
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
                          updateScreen();
                          Get.back();
                        } else {
                          counterController.clear();
                          counterController.counter.value = 1;
                          updateScreen();
                          Get.back();
                        }
                      } else {
                        showDialogForCheckResturantHinzufugen(
                            context, resturant, product);
                        updateScreen();
                      }
                      updateScreen();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  extraauflagen(Resturant resturant, Product product, BuildContext context,
      StateSetter setStateOfBottomSheet) {
    return ExpansionTile(
      iconColor: primaryColor,
      title: Text(
        'Extraauflagen',
        style: Theme.of(context).textTheme.button,
      ),
      subtitle: Text(
        'Optional',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12),
      ),
      trailing: Icon(CupertinoIcons.add_circled_solid),
      onExpansionChanged: (value) {
        List dd=[];
        setStateOfBottomSheet(() {
          if (shoppingCartController.extraZutatenList.length > 0) {
            if (shoppingCartController.extraZutatenList[0].nameResturant! !=
                resturant.nameResturant) {
              showDialogForExtraZutaten(resturant, product);
            } else {
              if (resturant.extra != null) {
                for (var b in shoppingCartController.extraZutatenList) {
                  for (var a in resturant.extra!) {
                    a.selected=false;
                  }
                }
              }
            }
          } else {
            for (var a in resturant.extra!) {
              a.selected=false;
            }
            setStateOfBottomSheet(() {});
          }
        });
      },
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: resturant.extra!.length,
          itemBuilder: (_,index){
            var s=resturant.extra![index];
            for(var a in shoppingCartController.extraZutatenList){
              if(a.zutatenName==s.name&&a.nameProduct==product.nameProduct&&a.nameResturant==resturant.nameResturant){
                s.selected=true;
              }
            }
        return Stack(
          children: [
            ListTile(
              leading: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                checkColor: Color(0xffffffff),
                // color of tick Mark
                activeColor: primaryColor,
                value: s.selected,
                onChanged: (value) {
                  Extra extra = Extra(name: s.name, price: s.price);
                  setStateOfBottomSheet(() {
                    if (s.selected == true) {
                      _removeFromExtraZutatenList(extra, resturant);
                    } else {
                      _addToExtraZutatenList(extra, product, resturant);
                    }
                    s.selected = !s.selected;
                  });
                },
              ),
              title: Text(
                '${s.name}',
                style: s.selected
                    ? Theme.of(context)
                    .primaryTextTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.bold)
                    : Theme.of(context).primaryTextTheme.headline3,
              ),
              onTap: () {
                Extra extra = Extra(name: s.name, price: s.price);
                setStateOfBottomSheet(() {
                  if (s.selected == true) {
                    _removeFromExtraZutatenList(extra, resturant);
                  } else {
                    _addToExtraZutatenList(extra, product, resturant);
                  }
                  s.selected = !s.selected;
                });
              },
            ),
            Positioned(
              top: 0,
              right: 10,
              child: IconButton(
                icon: Icon(CupertinoIcons.info),
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 20,
              right: 70,
              child: Text(
                '\€  ${s.price.toStringAsFixed(2)}',
                style: s.selected
                    ? Theme.of(context)
                    .primaryTextTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.bold)
                    : Theme.of(context).primaryTextTheme.headline3,
              ),
            ),
          ],
        );
        })
       /* if (resturant.extra != null)
          for (var s in resturant.extra!)
            Stack(
              children: [
                ListTile(
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    checkColor: Color(0xffffffff),
                    // color of tick Mark
                    activeColor: primaryColor,
                    value: s.selected,
                    onChanged: (value) {
                      Extra extra = Extra(name: s.name, price: s.price);
                      setStateOfBottomSheet(() {
                        if (s.selected == true) {
                          _removeFromExtraZutatenList(extra, resturant);
                        } else {
                          _addToExtraZutatenList(extra, product, resturant);
                        }
                        s.selected = !s.selected;
                      });
                    },
                  ),
                  title: Text(
                    '${s.name}',
                    style: s.selected
                        ? Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(fontWeight: FontWeight.bold)
                        : Theme.of(context).primaryTextTheme.headline3,
                  ),
                  onTap: () {
                    Extra extra = Extra(name: s.name, price: s.price);
                    setStateOfBottomSheet(() {
                      if (s.selected == true) {
                        _removeFromExtraZutatenList(extra, resturant);
                      } else {
                        _addToExtraZutatenList(extra, product, resturant);
                      }
                      s.selected = !s.selected;
                    });
                  },
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: IconButton(
                    icon: Icon(CupertinoIcons.info),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 70,
                  child: Text(
                    '\€  ${s.price.toStringAsFixed(2)}',
                    style: s.selected
                        ? Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(fontWeight: FontWeight.bold)
                        : Theme.of(context).primaryTextTheme.headline3,
                  ),
                ),
              ],
            ),*/
      ],
      /*children: product.extra!.asMap().entries.map((e) {
        Extra extra=Extra(name: e.value.name, price: e.value.price);
        return Stack(
          children: [
            ListTile(
              leading: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  checkColor: Color(0xffffffff),
                  // color of tick Mark
                  activeColor: primaryColor,
                  value: e.value.selected,
                  onChanged: (value) {
                    setStateOfBottomSheet(() {
                      if(e.value.selected==true){
                        _removeFromExtraZutatenList(extra, product, resturant);
                      }else{
                        _addToExtraZutatenList(extra, product, resturant);
                      }
                      e.value.selected = !e.value.selected;
                    });
                  },
                ),

              title: Text(
                '${e.value.name}',
                style: e.value.selected
                    ? Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold)
                    : Theme.of(context).primaryTextTheme.headline3,
              ),
              onTap: () {
                setStateOfBottomSheet(() {
                 if(e.value.selected==true){
                   _removeFromExtraZutatenList(extra, product, resturant);
                 }else{
                   _addToExtraZutatenList(extra, product, resturant);
                 }
                 e.value.selected = !e.value.selected;
                });
              },
            ),
            Positioned(
              top: 0,
              right: 10,
              child: IconButton(
                icon: Icon(CupertinoIcons.info),
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 20,
              right: 70,
              child: Text(
                '\€  ${e.value.price.toStringAsFixed(2)}',
                style: e.value.selected
                    ? Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold)
                    : Theme.of(context).primaryTextTheme.headline3,
              ),
            ),
          ],
        );
      }).toList(),*/
    );
  }

  comment() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Anmerkungen',
            style: Theme.of(context).primaryTextTheme.button,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Bitte teile uns mit, ob du Allergien hast oder auf Bestimmte Zutaten verzichten willst.',
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            maxLines: 2,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1, color: greyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).iconTheme.color!),
              ),
              hintStyle: Theme.of(context).primaryTextTheme.headline3,
              hintText: "z.B Keine Mayonnaise",
              label: Text(
                "z.B Keine Mayonnaise",
              ),
              labelStyle: Theme.of(context).primaryTextTheme.headline3,
            ),
          ),
        ],
      ),
    );
    /* ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      dense:true,
      trailing: Icon(
        CupertinoIcons.bubble_right,
        size: 25,
        // color: primaryColor,
      ),
      title:Text(
        'Kommentar hinzufügen',
        style: TextStyle(
          // color: primaryColor,
          fontSize: 14,
        ),
      ),
      onTap: (){},
    );*/
  }

  productInfo(Product product, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      dense: true,
      trailing: Icon(
        CupertinoIcons.info,
        // color: primaryColor,
      ),
      title: Text(
        product.nameProduct!,
        style: Theme.of(context).textTheme.button!.copyWith(fontSize: 22),
      ),
      subtitle: Text(
        'subTitle',
        style: Theme.of(context)
            .primaryTextTheme
            .subtitle1!
            .copyWith(fontSize: 12),
      ),
      onTap: () {},
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
          Tab(text: resturant!.products![i].nameProductType),
      ],
      controller: tabController,
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
                    _removeAllDataFromzutatenList();
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
                    _removeAllDataFromzutatenList();
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

  Future<dynamic> showDialogForExtraZutaten(
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
                    _removeAllDataFromzutatenList();
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
                    if (shoppingCartController.orderList.length > 0) {
                      Get.to(() => ShoppingCarts());
                    } else {
                      _removeAllDataFromzutatenList();
                      Get.back();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
