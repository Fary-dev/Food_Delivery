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
  int itemCunt = 1;
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
            onPressed: () {},
          ),
          title: Text(
            "Deine Warenkörbe",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  CupertinoIcons.delete,
                  color: Colors.redAccent[400],
                ),
                onPressed: () {})
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
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Center(
                                              child: Text('Resturant Name')),
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: state.prod.length,
                                            itemBuilder: (context, index) {
                                              Product _prd = state.prod[index];
                                              return Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            30,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
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
                                                                      size: 20,
                                                                      color: Colors
                                                                              .redAccent[
                                                                          400],
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        itemCunt ==
                                                                                1
                                                                            ? listOrderIsEmpty =
                                                                                true
                                                                            : listOrderIsEmpty =
                                                                                false;
                                                                        itemCunt ==
                                                                                1
                                                                            ? BlocProvider.of<ProductBloc>(context).add(DeleteFromCart(pro: _prd))
                                                                            : itemCunt--;
                                                                      });
                                                                    }),
                                                                Text(itemCunt
                                                                    .toString()),
                                                                IconButton(
                                                                    icon: Icon(
                                                                      CupertinoIcons
                                                                          .add,
                                                                      size: 20,
                                                                      color: Colors
                                                                              .redAccent[
                                                                          400],
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        itemCunt++;
                                                                      });
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
                                                                        _prd.nameProduct,
                                                                      ),
                                                                      Text(_prd
                                                                          .price
                                                                          .toString()
                                                                          .padRight(
                                                                              5,
                                                                              '0'))
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              0.0),
                                                                      child: Text(
                                                                          '+ souce')),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 100.0),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  commentIsEmpty ==
                                                                          false
                                                                      ? commentIsEmpty =
                                                                          true
                                                                      : commentIsEmpty =
                                                                          false;
                                                                });
                                                              },
                                                              child: Text(
                                                                'Kommentar hinzufügen',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .redAccent[
                                                                        400]),
                                                              )),
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
                                            child: state.prod.length == 0
                                                ? Text(
                                                    'Total : 0.00',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 30),
                                                  )
                                                : Text(
                                                    'Total : ${(state.prod.reduce((x, y) => Product(id: 1, nameProduct: '', price: x.price + y.price)).price)}'
                                                        .padRight(5, '0'),
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
              ));
  }
}

//

//------------------------------------------------------------------
