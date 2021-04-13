import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/models_and_data/myBloc/models_and_data.dart';
import 'package:mjam/models_and_data/myBloc/productBloc.dart';

class ShoppingCarts extends StatefulWidget {
  ShoppingCarts({
    Key key,
  }) : super(key: key);

  @override
  _ShoppingCartsState createState() => _ShoppingCartsState();
}

class _ShoppingCartsState extends State<ShoppingCarts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Text('')],
              ),
              Container(
                child: Text(
                  "Deine Warenkörbe",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Ändern",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.red[700],
                    fontSize: 13,
                  ),
                ),
              )
            ],
          )),
      body: Column(
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
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.prod.length,
                                    itemBuilder: (context, index) {
                                      Product _prd = state.prod[index];
                                      return Column(
                                        children: [
                                          Card(
                                            child: Container(
                                              height: 80,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 10,
                                              ),
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          _prd.nameProduct,
                                                        ),
                                                        Text('\€ ${_prd.price}'
                                                            .padRight(5, '0')),
                                                      ],
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        CupertinoIcons.trash,
                                                        color: Colors.red,
                                                      ),
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    ProductBloc>(
                                                                context)
                                                            .add(DeleteFromCart(
                                                                pro: _prd));
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
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
                                    child: Text(
                                      'Total : ${(state.prod.reduce((x, y) => Product(id: 1, nameProduct: '', price: x.price + y.price)).price)}'
                                          .padRight(5, '0'),
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 30),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Container(),
            ),
          ),
        ],
      ),
    );
  }
}

// Center(

//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 margin: EdgeInsets.all(60),
//                                 child:
//                                     Text('Bitte lege etwas in den Warenkorb.'),
//                               ),
//                               Container(
//                                 height: 80,
//                                 width: 80,
//                                 margin: EdgeInsets.all(0),
//                                 child: Image.asset('assets/korb.png'),
//                               ),
//                               Container(
//                                   child: CupertinoButton(
//                                 child: new Text(
//                                   "Zur Resturantliste",
//                                   textAlign: TextAlign.center,
//                                   style: new TextStyle(color: Colors.red[700]),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return HomePage();
//                                   }));
//                                 },
//                               )),
//                             ],
//                           ),
//                         )
