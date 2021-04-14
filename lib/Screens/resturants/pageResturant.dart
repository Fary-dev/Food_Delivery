import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/Widgets/search.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/bloc/blocEvents/events.dart';
import 'package:mjam/bloc/blocStates/states.dart';
import 'package:mjam/bottom_Navigator/shopping_carts.dart';
import 'package:mjam/models_and_data/models_and_data.dart';
import 'package:mjam/bloc/productBloc.dart';

import 'info_resturant.dart';

class PageResturant extends StatefulWidget {
  final Resturant resturant;
  PageResturant(this.resturant, {Key key}) : super(key: key);

  @override
  _PageResturantState createState() => _PageResturantState(resturant);
}

class _PageResturantState extends State<PageResturant>
    with SingleTickerProviderStateMixin {
  final Resturant resturant;

  _PageResturantState(this.resturant);

  bool likeBottumPress = false;
  TabController tabController;
  int totalProduct = 0;
  int itemCunt = 0;
  double addPrice = 0;
  String changeText;
  void subItems(int a, double b) {
    // ignore: unused_local_variable
    double c = a + b;
    setState(() {});
  }

  void malItem(int a, double b) {
    double d = a * b;
    addPrice = addPrice + d;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: resturant.products.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: Icon(
                        likeBottumPress
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: likeBottumPress
                            ? Colors.red[700]
                            : Colors.red[700]),
                    onPressed: () {
                      setState(() {
                        likeBottumPress = !likeBottumPress;
                      });
                    },
                  ),
                )
              ],
              elevation: 10,
              leading: BottomAppBar(
                elevation: 0,
                color: Colors.transparent,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.red[700],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 180.0,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Image.asset(
                        resturant.photoResturant.toString(),
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.topLeft,
                            child: Text(
                              resturant.nameResturant,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: IconButton(
                              icon: Icon(
                                Icons.info_outline,
                                size: 38,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InfoResturant(resturant),
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Container(
                            //padding: EdgeInsets.all(0),
                            //alignment: Alignment.topLeft,
                            height: 20,
                            width: 100,
                            child: Rating(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            resturant.ratingResturant.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 0),
                              child: Icon(
                                Icons.timer_outlined,
                                size: 20,
                              )),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " ca.${resturant.deliveryDuration}min",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 0.4,
                                decoration: TextDecoration.none,
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                              padding: EdgeInsets.only(left: 0),
                              child: Icon(
                                Icons.location_on_outlined,
                                size: 20,
                              )),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${resturant.distance} km",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 0.4,
                                decoration: TextDecoration.none,
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      borderOnForeground: false,
                      margin: EdgeInsets.only(top: 10),
                      child: Container(
                        color: Colors.grey[100],
                        child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          //margin: EdgeInsets.only(left: 0),
                          child: Search(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 400.0,
//========================================= TabBar =============================
              bottom: TabBar(
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                isScrollable: true,
                indicatorColor: Colors.red[700],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorWeight: 4,
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

        body: TabBarView(controller: tabController, children: [
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
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () {
                            setState(
                              () {
                                showModalBottomSheet(
                                  enableDrag: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                              20,
                                            ),
                                            topLeft: Radius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
//==================================================================================== Product Name =======================
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          product.nameProduct,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.cancel,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      'subTitle',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black45,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

//======================================================================== Allergene & Zusatzstoffe =======================
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.error_outline_sharp,
                                                      color:
                                                          Colors.redAccent[400],
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Allergene & Zusatzstoffe',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .redAccent[400],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 10,
                                              color: Colors.grey[200],
                                            ),
//=================================================================================== Extraauflagen =======================
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 8,
                                                ),
                                                // ignore: deprecated_member_use
                                                child: FlatButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '1. Extraauflagen',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Optional',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black26,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        color: Colors
                                                            .redAccent[400],
                                                        size: 50,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Container(
                                              color: Colors.grey[200],
                                              height: 2,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),

//============================================================================ Kommentare hinzufügen =======================
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                // ignore: deprecated_member_use
                                                child: FlatButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.comment_rounded,
                                                        size: 25,
                                                        color: Colors
                                                            .redAccent[400],
                                                      ),
                                                      Text(
                                                        'Kommentar hinzufügen',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .redAccent[400],
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.grey[200],
                                              height: 2,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
//========================================================================================= - and + =======================
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // BlocProvider.of<
                                                      //             ProductBloc>(
                                                      //         context)
                                                      //     .add(DeleteFromCart(
                                                      //         pro: product));
                                                      setState(() {
                                                        itemCunt > 0
                                                            ? itemCunt--
                                                            : itemCunt =
                                                                itemCunt;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .do_disturb_on_outlined,
                                                      size: 40,
                                                      color: itemCunt == 0
                                                          ? Colors.grey[200]
                                                          : Colors
                                                              .redAccent[400],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      itemCunt.toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        itemCunt++;
                                                        subItems(itemCunt,
                                                            product.price);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .add_circle_outline_sharp,
                                                      size: 40,
                                                      color:
                                                          Colors.redAccent[400],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

//==================================================================================== HINZUFÜGEN =========================

                                            Expanded(
                                              flex: 1,
                                              // ignore: deprecated_member_use
                                              child: FlatButton(
                                                color: Colors.redAccent[400],
                                                onPressed: () {
                                                  setState(() {
                                                    BlocProvider.of<
                                                                ProductBloc>(
                                                            context)
                                                        .add(AddToCart(
                                                            product: product));
                                                    totalProduct =
                                                        (totalProduct +
                                                            itemCunt);
                                                    totalProduct != null
                                                        ? changeText =
                                                            'WARENKORB ÖFFNEN'
                                                        : changeText =
                                                            'HINZUFÜGEN';
                                                    malItem(itemCunt,
                                                        product.price);

                                                    itemCunt = 0;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors
                                                                    .redAccent[
                                                                400]),
                                                        child: Center(
                                                          child: Text(
                                                            totalProduct
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors
                                                                      .redAccent[
                                                                  400],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        changeText =
                                                            'HINZUFÜGEN',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        itemCunt == 1
                                                            ? '\€ ${product.price.toString().padRight(4, "0")}'
                                                            : (itemCunt *
                                                                    product
                                                                        .price)
                                                                .toString()
                                                                .padRight(
                                                                    5, '0'),
                                                        // (itemCunt *
                                                        //         product
                                                        //             .price)
                                                        //     .toString()
                                                        //     .padRight(
                                                        //         5, '0'),
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\€ ${product.price.toString().padRight(4, "0")}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
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
                                              color: Colors.grey,
                                            ),
                                            // color: Colors.green[700],
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      Icon(
                                        Icons.add_sharp,
                                        color: Colors.red[700],
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
        ]),
      ),
      bottomSheet: totalProduct >= 1
          ? Container(
              height: 74,
              width: MediaQuery.of(context).size.width,
              color: Colors.redAccent[400],
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.redAccent[400],
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCarts(),
                      ),
                    );
                  });
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
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          state.productsList.length.toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.redAccent[400],
                                          ),
                                        ),
                                      ),
                                    )
                                  : state is FailState
                                      ? Tooltip(
                                          message: '${state.fail}',
                                          child: Text('0'),
                                        )
                                      : Text('')),
                      Text(
                        changeText = 'WARENKORB ÖFFNEN',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        addPrice == null
                            ? ''
                            : addPrice.toString().padRight(5, '0'),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
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
