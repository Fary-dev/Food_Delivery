import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Home_Page/HomePage.dart';
import 'package:mjam/bloc/Counter_Bloc/counter_select_product.dart';
import 'package:mjam/bloc/Order_Bloc/events.dart';
import 'package:mjam/bloc/Order_Bloc/states.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:mjam/bloc/Order_Bloc/productBloc.dart';

class ShoppingCarts extends StatefulWidget {
  ShoppingCarts({
    Key key,
  }) : super(key: key);

  @override
  _ShoppingCartsState createState() => _ShoppingCartsState();
}

class _ShoppingCartsState extends State<ShoppingCarts> {
  final TextEditingController textFildController = TextEditingController();
  bool commentIsEmpty = true;
  bool listOrderIsEmpty;

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Deine Warenkörbe",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: blackColor),
        ),
        actions: [
          IconButton(
              icon: Icon(
                CupertinoIcons.delete,
                color: primaryColor,
              ),
              onPressed: () {
                productBloc.add(ClearAllCart());
                counterBloc
                    .add(CounterEvent(value: 1, status: EventStatus.clearAll));

                setState(() {});
              })
        ],
      ),
      body: productBloc.cartOrder.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: BlocBuilder<ProductBloc, BlocState>(
                    builder: (context, state) => state is LodingState
                        ? CupertinoActivityIndicator()
                        : state is FailState
                            ? Center(
                                child: Text('${state.massage}'),
                              )
                            : state is SuccessState
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: Text(
                                          state.orderList.length > 0
                                              ? 'state.orderList[0].resturant.nameResturant'
                                              : '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: state.orderList.length,
                                          itemBuilder: (context, index) {
                                            var _order = state.orderList[index];

                                            return Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      30,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              IconButton(
                                                                icon: Icon(
                                                                  CupertinoIcons
                                                                      .minus,
                                                                  size: 25,
                                                                  color:
                                                                      primaryColor,
                                                                ),
                                                                onPressed: () {
                                                                  print(state
                                                                      .setMyOrderList
                                                                      .length);
                                                                  // if (_order
                                                                  //         .quantity >
                                                                  //     1) {
                                                                  //   productBloc.add(DeleteFromCart(
                                                                  //       order: Order(
                                                                  //           quantity:
                                                                  //               _order.quantity--,
                                                                  //           totalPrise: -_order.product.price,
                                                                  //           product: _order.product,
                                                                  //           resturant: _order.resturant)));
                                                                  // } else if (productBloc
                                                                  //         .cartOrder
                                                                  //         .length ==
                                                                  //     1) {
                                                                  //   productBloc.add(
                                                                  //       ClearAllCart());
                                                                  //   counterBloc.add(CounterEvent(
                                                                  //       value:
                                                                  //           1,
                                                                  //       status:
                                                                  //           EventStatus.clearAll));
                                                                  // } else {
                                                                  //   productBloc.add(
                                                                  //       DeleteFromCart(
                                                                  //     order:
                                                                  //         _order,
                                                                  //   ));
                                                                  //   print(state
                                                                  //       .orderList
                                                                  //       .length);
                                                                  // }
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              Text(
                                                                  '${_order.quantity}'),
                                                              IconButton(
                                                                icon: Icon(
                                                                  CupertinoIcons
                                                                      .add,
                                                                  size: 25,
                                                                  color:
                                                                      primaryColor,
                                                                ),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    productBloc.add(AddToCart(
                                                                        order: Order(
                                                                            totalPrise: _order
                                                                                .product.price,
                                                                            quantity:
                                                                                1,
                                                                            product:
                                                                                _order.product,
                                                                            resturant: _order.resturant)));

                                                                    print(state
                                                                        .orderList
                                                                        .length
                                                                        .toString());
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            flex: 4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      _order
                                                                          .product
                                                                          .nameProduct,
                                                                    ),
                                                                    Text(
                                                                      (_order.product.price *
                                                                              _order.quantity)
                                                                          .toStringAsFixed(2),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                0.0),
                                                                    child: Text(
                                                                        '+ souce',
                                                                        style: TextStyle(
                                                                            color:
                                                                                greyColor))),
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0.0),
                                                                  child:
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              commentIsEmpty == false ? commentIsEmpty = true : commentIsEmpty = false;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Kommentar hinzufügen',
                                                                            style:
                                                                                TextStyle(color: primaryColor),
                                                                          )),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      commentIsEmpty == false
                                                          ? TextField(
                                                              controller:
                                                                  textFildController,
                                                            )
                                                          : Text('')
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          child: state.orderList.length == 0
                                              ? Text(
                                                  '0.00',
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 30),
                                                )
                                              : Center(
                                                  child: Text(
                                                    '\€ ${productBloc.cartOrder.reduce((x, y) => Order(totalPrise: x.totalPrise + y.totalPrise)).totalPrise.toStringAsFixed(2)}',
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 30),
                                                  ),
                                                ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(60),
                    child: Text('Bitte lege etwas in den Warenkorb.'),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(0),
                    child: Image.asset('assets/korb.png'),
                  ),
                  Container(
                      child: CupertinoButton(
                    child: new Text(
                      "Zur Resturantliste",
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: primaryColor),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    },
                  )),
                ],
              ),
            ),
    );
  }
}
