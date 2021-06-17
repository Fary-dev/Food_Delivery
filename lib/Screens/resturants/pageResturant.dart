import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Clipper_Resturant_Photo.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/Widgets/search.dart';
import 'package:mjam/bloc/Counter_Bloc/counter_select_product.dart';
import 'package:mjam/bloc/Order_Bloc/events.dart';
import 'package:mjam/bloc/Order_Bloc/states.dart';
import 'package:mjam/bottom_Navigation_bar/Shopping/shopping_Controller.dart';
import 'package:mjam/bottom_Navigation_bar/Shopping/shopping_carts.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:mjam/bloc/Order_Bloc/productBloc.dart';
import 'info_resturant.dart';

class PageResturant extends StatefulWidget {
  final Resturant resturant;
  PageResturant({Key key, this.resturant}) : super(key: key);

  @override
  _PageResturantState createState() => _PageResturantState(resturant);
}

class _PageResturantState extends State<PageResturant>
    with SingleTickerProviderStateMixin {
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());
  final Resturant resturant;
  _PageResturantState(this.resturant);

  bool likeBottumPress = false;
  TabController tabController;
  String changeText;
  bool showBottomSheet = false;

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
    ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
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
                      icon: Icon(
                        likeBottumPress
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            likeBottumPress = !likeBottumPress;
                          },
                        );
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
              bottom: TabBar(
                labelStyle: Theme.of(context).tabBarTheme.labelStyle,
                isScrollable: true,
                indicatorColor: primaryColor,
                labelColor: Theme.of(context).tabBarTheme.labelColor,
                unselectedLabelColor: Theme.of(context)
                    .tabBarTheme
                    .unselectedLabelColor
                    .withOpacity(0.6),
                indicatorWeight: 4,
                unselectedLabelStyle:
                    Theme.of(context).tabBarTheme.unselectedLabelStyle,
                tabs: [
                  for (int i = 0; i < resturant.products.length; i++)
                    Tab(text: resturant.products[i].nameProducts),
                ],
                controller: tabController,
              ),
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
                              setState(
                                () {
                                  showModalBottomSheet(
                                    // isScrollControlled: true,

                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                  20,
                                                ),
                                                topLeft: Radius.circular(
                                                  20,
                                                ),
                                              ),
                                            ),
                                            child:
                                                BlocBuilder<CounterBloc, int>(
                                              builder: (context, state) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
//==================================================================================== Product Name =======================
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  product
                                                                      .nameProduct,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .clear_circled_solid,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              'subTitle',
                                                              style: Theme.of(
                                                                      context)
                                                                  .primaryTextTheme
                                                                  .subtitle1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: greyColor,
                                                      width: double.infinity,
                                                      height: 2,
                                                    ),

//======================================================================== Allergene & Zusatzstoffe =======================
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .info,
                                                              color:
                                                                  primaryColor,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                'Allergene & Zusatzstoffe',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      primaryColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: greyColor,
                                                      width: double.infinity,
                                                      height: 2,
                                                    ),
//=================================================================================== Extraauflagen =======================
                                                    Expanded(
                                                      flex: 1,
                                                      child: MaterialButton(
                                                        onPressed: () {},
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '1. Extraauflagen',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  'Optional',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .primaryTextTheme
                                                                      .subtitle1,
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(
                                                              CupertinoIcons
                                                                  .chevron_down,
                                                              color:
                                                                  primaryColor,
                                                              size: 30,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      color: greyColor,
                                                      height: 2,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    ),

//============================================================================ Kommentare hinzufügen =======================
                                                    Expanded(
                                                      flex: 1,
                                                      child: MaterialButton(
                                                        onPressed: () {},
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .bubble_right,
                                                              size: 25,
                                                              color:
                                                                  primaryColor,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Kommentar hinzufügen',
                                                              style: TextStyle(
                                                                color:
                                                                    primaryColor,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: greyColor,
                                                      height: 2,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    ),
//========================================================================================= - and + =======================
                                                    Expanded(
                                                      flex: 1,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          IconButton(
                                                            icon: Icon(
                                                              CupertinoIcons
                                                                  .minus_circle,
                                                              size: 40,
                                                              color: counterBloc
                                                                          .state <
                                                                      2
                                                                  ? greyColor
                                                                  : primaryColor,
                                                            ),
                                                            onPressed: () {
                                                              if (counterBloc
                                                                      .state >
                                                                  1) {
                                                                counterBloc.add(
                                                                    CounterEvent(
                                                                        value:
                                                                            1,
                                                                        status:
                                                                            EventStatus.decrement));
                                                                productBloc.add(
                                                                  DeleteFromCart(
                                                                    product:
                                                                        product,
                                                                    order: Order(
                                                                        product:
                                                                            product,
                                                                        totalPrise:
                                                                            product
                                                                                .price,
                                                                        quantity:
                                                                            1,
                                                                        resturant:
                                                                            resturant),
                                                                  ),
                                                                );
                                                              } else {
                                                                counterBloc
                                                                    .state;
                                                              }
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Text(
                                                              '$state',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              CupertinoIcons
                                                                  .add_circled,
                                                              size: 40,
                                                              color:
                                                                  primaryColor,
                                                            ),
                                                            onPressed: () {
                                                              if (counterBloc
                                                                      .state ==
                                                                  1) {
                                                                productBloc.add(
                                                                    AddToCart(
                                                                        product:
                                                                            product,
                                                                        order:
                                                                            Order(
                                                                          product:
                                                                              product,
                                                                          totalPrise:
                                                                              product.price,
                                                                          quantity:
                                                                              1,
                                                                          resturant:
                                                                              resturant,
                                                                        )));
                                                                productBloc.add(
                                                                    AddToCart(
                                                                        product:
                                                                            product,
                                                                        order:
                                                                            Order(
                                                                          product:
                                                                              product,
                                                                          totalPrise:
                                                                              product.price,
                                                                          quantity:
                                                                              1,
                                                                          resturant:
                                                                              resturant,
                                                                        )));
                                                                counterBloc.add(
                                                                    CounterEvent(
                                                                        value:
                                                                            1,
                                                                        status:
                                                                            EventStatus.increment));
                                                              } else {
                                                                productBloc.add(
                                                                    AddToCart(
                                                                        product:
                                                                            product,
                                                                        order:
                                                                            Order(
                                                                          product:
                                                                              product,
                                                                          totalPrise:
                                                                              product.price,
                                                                          quantity:
                                                                              1,
                                                                          resturant:
                                                                              resturant,
                                                                        )));
                                                                counterBloc.add(
                                                                    CounterEvent(
                                                                        value:
                                                                            1,
                                                                        status:
                                                                            EventStatus.increment));
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),

//==================================================================================== HINZUFÜGEN =========================

                                                    Expanded(
                                                      flex: 1,
                                                      child: MaterialButton(
                                                        color: primaryColor,
                                                        onPressed: () {
                                                          setState(() {
                                                            showBottomSheet =
                                                                true;
                                                            counterBloc.itemCart !=
                                                                    null
                                                                ? changeText =
                                                                    'WARENKORB ÖFFNEN'
                                                                : changeText =
                                                                    'HINZUFÜGEN';
                                                          });
                                                          if (counterBloc
                                                                  .state ==
                                                              1) {
                                                            productBloc.add(
                                                                AddToCart(
                                                                    product:
                                                                        product,
                                                                    order:
                                                                        Order(
                                                                      resturant:
                                                                          resturant,
                                                                      product:
                                                                          product,
                                                                      quantity:
                                                                          counterBloc
                                                                              .state,
                                                                      totalPrise: product
                                                                              .price *
                                                                          counterBloc
                                                                              .state,
                                                                    )));
                                                            counterBloc.add(
                                                                CounterEvent(
                                                                    value: 1,
                                                                    status: EventStatus
                                                                        .clearState));
                                                            Navigator.pop(
                                                                context);
                                                            updateScreen();
                                                          } else {
                                                            counterBloc.add(
                                                                CounterEvent(
                                                                    value: 1,
                                                                    status: EventStatus
                                                                        .clearState));
                                                            Navigator.pop(
                                                                context);
                                                            updateScreen();
                                                          }
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(
                                                                CupertinoIcons
                                                                    .bag,
                                                                color:
                                                                    whiteColor,
                                                                size: 35,
                                                              ),
                                                              Text(
                                                                changeText =
                                                                    'HINZUFÜGEN',
                                                                style: Theme.of(
                                                                        context)
                                                                    .primaryTextTheme
                                                                    .button
                                                                    .apply(
                                                                        color:
                                                                            whiteColor),
                                                              ),
                                                              Text(
                                                                (counterBloc.state *
                                                                        product
                                                                            .price)
                                                                    .toStringAsFixed(
                                                                        2),
                                                                style: Theme.of(
                                                                        context)
                                                                    .primaryTextTheme
                                                                    .button
                                                                    .apply(
                                                                        color:
                                                                            whiteColor,
                                                                        fontSizeDelta:
                                                                            5),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ));
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      product.nameProduct,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\€ ${product.price.toString().padRight(4, "0")}',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2,
                                    ),
                                    SizedBox(width: 10),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: greyColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                        ),
                                        Icon(
                                          CupertinoIcons.add,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
          ],
        ),
      ),
      bottomSheet: counterBloc.show == true
          ? Container(
              height: 74,
              width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child: MaterialButton(
                color: primaryColor,
                onPressed: () {
                  counterBloc.add(CounterEvent(
                    value: 1,
                    status: EventStatus.clearState,
                  ));

                  if (productBloc.setMyCart.length != 0 &&
                      shoppingCartController.listController.length == 0) {
                    shoppingCartController
                        .setTextFieldController(productBloc.setMyCart.length);
                  } else if (productBloc.setMyCart.length >
                      shoppingCartController.listController.length) {
                    int result = productBloc.setMyCart.length -
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
                      BlocBuilder<ProductBloc, BlocState>(
                          builder: (context, state) => state is LodingState
                              ? CupertinoActivityIndicator()
                              : state is SuccessState
                                  ? Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          productBloc.cartOrder.isEmpty
                                              ? ''
                                              : state.orderList.length
                                                  .toString(),
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .button
                                              .apply(
                                                  color: primaryColor,
                                                  fontSizeDelta: 5),
                                        ),
                                      ),
                                    )
                                  : state is FailState
                                      ? Tooltip(
                                          message: '${state.massage}',
                                          child: Text('0'),
                                        )
                                      : Text('')),
                      Text(changeText = 'WARENKORB ÖFFNEN',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .button
                              .apply(color: whiteColor)),
                      Text(
                        productBloc.cartOrder.isEmpty
                            ? ''
                            : productBloc.cartOrder
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
}
