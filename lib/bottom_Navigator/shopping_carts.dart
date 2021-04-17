import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/Screens/HomePage.dart';
import 'package:mjam/bloc/blocEvents/events.dart';
import 'package:mjam/bloc/blocStates/states.dart';
import 'package:mjam/models_and_data/models_and_data.dart';
import 'package:mjam/bloc/productBloc.dart';

class ShoppingCarts extends StatefulWidget {
  ShoppingCarts({
    Key key,
  }) : super(key: key);

  @override
  _ShoppingCartsState createState() => _ShoppingCartsState();
}

class _ShoppingCartsState extends State<ShoppingCarts> {
  bool commentIsEmpty = true;
  bool listOrderIsEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.red[400],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Deine Warenkörbe",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        actions: [
          IconButton(
              icon: Icon(
                CupertinoIcons.delete,
                color: Colors.redAccent[400],
              ),
              onPressed: () {
                BlocProvider.of<ProductBloc>(context).add(ClearAllCart());
                setState(() {
                  listOrderIsEmpty = true;
                });
              })
        ],
      ),
      body: listOrderIsEmpty == false
          ? Column(
              children: [
                Expanded(
                  child: BlocBuilder<ProductBloc, BlocState>(
                    builder: (context, state) => state is LodingState
                        ? CupertinoActivityIndicator()
                        : state is FailState
                            ? Center(
                                child: Text('${state.fail}'),
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
                                          state.orderList[0].resturant
                                              .nameResturant,
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
                                            Order _order =
                                                state.orderList[index];
                                            double totalPrice =
                                                _order.quantity *
                                                    _order.product.price;

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
                                                                    color: Colors
                                                                            .redAccent[
                                                                        400],
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      _order.quantity >
                                                                              1
                                                                          ? BlocProvider.of<ProductBloc>(context)
                                                                              .add(DeleteFromCart(order: Order(quantity: _order.quantity--, totalPrise: totalPrice - _order.product.price)))
                                                                          : BlocProvider.of<ProductBloc>(context).add(DeleteFromCart(order: _order));
                                                                    });
                                                                    print(_order
                                                                        .totalPrise
                                                                        .toStringAsFixed(
                                                                            2));
                                                                  }),
                                                              Text(
                                                                  '${_order.quantity}'),
                                                              IconButton(
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .add,
                                                                    size: 25,
                                                                    color: Colors
                                                                            .redAccent[
                                                                        400],
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    BlocProvider.of<ProductBloc>(context).add(AddToCart(
                                                                        order: Order(
                                                                            quantity:
                                                                                _order.quantity++,
                                                                            totalPrise: _order.totalPrise++)));

                                                                    setState(
                                                                        () {});
                                                                  }),
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
                                                                      totalPrice
                                                                          .toStringAsFixed(
                                                                              2),
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
                                                                                Colors.black26))),
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
                                                                                TextStyle(color: Colors.redAccent[400]),
                                                                          )),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      commentIsEmpty == false
                                                          ? TextField()
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
                                                  '',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 30),
                                                )
                                              : Text(
                                                  '0.00',
                                                  // _productBloc
                                                  //     .order.totalSumPrice
                                                  //     .toStringAsFixed(2),

                                                  // state.orderList
                                                  //     .reduce((a, b) => Order(
                                                  //         totalSumPrice: a
                                                  //                 .totalSumPrice +
                                                  //             b.totalSumPrice))
                                                  //     .totalSumPrice
                                                  //     .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 30),
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
                      style: new TextStyle(color: Colors.red[700]),
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
