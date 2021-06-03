import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
  List<TextEditingController> listController = [];
  List<bool> commendSelect = [];
  List<bool> buttonCheck = [];

  @override
  void dispose() {
    super.dispose();
    for (TextEditingController c in listController) {
      c.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: productBloc.cartOrder.length != 0
            ? IconButton(
                icon: Icon(
                  Icons.menu,
                  color: primaryColor,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            : null,
        title: Text(
          "Deine Warenkörbe",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: blackColor),
        ),
        actions: [
          productBloc.cartOrder.length != 0
              ? IconButton(
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    productBloc.add(ClearAllCart());
                    counterBloc.add(
                        CounterEvent(value: 1, status: EventStatus.clearAll));
                    setState(() {});
                  },
                )
              : IconButton(
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: greyColor,
                  ),
                  onPressed: () {},
                ),
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
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Text(
                                              state.orderList.length > 0
                                                  ? 'Deine Bestellung bei ${state.orderList[0].resturant.nameResturant}'
                                                  : '',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount:
                                              state.setMyProductsList.length,
                                          itemBuilder: (context, index) {
                                            listController.add(
                                                new TextEditingController());
                                            var _order = state.setMyProductsList
                                                .elementAt(index);
                                            int count = state.orderList
                                                .where((element) =>
                                                    element.product == _order)
                                                .toList()
                                                .length;
                                            commendSelect.add(false);
                                            buttonCheck.add(false);

                                            return buildColumn(
                                                context,
                                                state,
                                                count,
                                                _order,
                                                productBloc,
                                                counterBloc,
                                                index,
                                                listController);
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
                                                    state.orderList
                                                        .reduce((x, y) => Order(
                                                            totalPrise: x
                                                                    .totalPrise +
                                                                y.totalPrise))
                                                        .totalPrise
                                                        .toStringAsFixed(2),
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 30),
                                                  ),
                                                ),
                                        ),
                                      )
                                    ],
                                  )
                                : null,
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

  buildColumn(
      BuildContext context,
      SuccessState state,
      int count,
      Product _order,
      ProductBloc productBloc,
      CounterBloc counterBloc,
      int index,
      listController) {
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.minus,
                      size: 20,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      print(state.orderList.length);
                      if (count > 1) {
                        var selectProduct = state.orderList
                            .firstWhere((order) => order.product == _order);
                        state.orderList.remove(selectProduct);
                      } else if (state.orderList.length == 1) {
                        productBloc.add(ClearAllCart());
                        counterBloc.add(CounterEvent(
                            value: 1, status: EventStatus.clearAll));
                      } else {
                        var selectProduct = state.orderList
                            .firstWhere((order) => order.product == _order);
                        state.orderList.remove(selectProduct);
                        state.setMyProductsList.remove(_order);
                      }
                      if (state.setMyProductsList.isEmpty) {
                        productBloc.add(ClearAllCart());
                        counterBloc.add(CounterEvent(
                            value: 1, status: EventStatus.clearAll));
                      }

                      print(state.orderList.length);
                      setState(() {});
                    },
                  ),
                  Text(
                    count.toString(),
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.add,
                      size: 20,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        productBloc.add(AddToCart(
                            product: _order,
                            order: Order(
                                totalPrise: _order.price,
                                quantity: 1,
                                product: _order,
                                resturant: state.orderList[index].resturant)));
                      });
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _order.nameProduct,
                        ),
                        Text(
                          '\€ ${(count * _order.price).toStringAsFixed(2)}',
                        )
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 0.0),
                        child: Text('+ souce',
                            style: TextStyle(color: greyColor))),
                    Container(
                      padding: EdgeInsets.only(left: 0.0),
                      child: commendSelect[index] == false
                          ? SizedBox(
                              height: 32,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      commendSelect[index] = true;
                                      buttonCheck[index] = false;
                                    });
                                  },
                                  child: Text(
                                    'Kommentar hinzufügen',
                                    style: TextStyle(color: primaryColor),
                                  )),
                            )
                          : null,
                    ),
                  ],
                ),
              )
            ],
          ),
          commendSelect[index] == true
              ? SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                            controller: listController[index],
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Kommentare..',
                            ),
                            onSaved: (value) {
                              setState(() {
                                if (value != null) {
                                  listController[index].text = value;
                                }
                              });
                            },
                            maxLines: 1,
                            style: TextStyle(color: blackColor, fontSize: 14),
                          ),
                        ),
                      ),
                      MaterialButton(
                        padding: EdgeInsets.all(5),
                        onPressed: () {
                          if (listController[index].text != '' &&
                              buttonCheck[index] == false) {
                            buttonCheck[index] = true;
                          } else {
                            commendSelect[index] = false;
                            listController[index].clear();
                          }
                          setState(() {});
                        },
                        child: Text(
                          listController[index].text != '' &&
                                  buttonCheck[index] == true &&
                                  listController[index].text != null
                              ? 'Entfernen'.toUpperCase()
                              : 'Hinzufügen'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        color: listController[index].text != '' &&
                                buttonCheck[index] == true &&
                                listController[index].text != null
                            ? Colors.red
                            : Colors.green,
                      )
                    ],
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
