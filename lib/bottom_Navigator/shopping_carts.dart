import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mjam/Screens/HomePage.dart';

class ShoppingCarts extends StatefulWidget {
  ShoppingCarts({Key key}) : super(key: key);

  @override
  _ShoppingCartsState createState() => _ShoppingCartsState();
}

class _ShoppingCartsState extends State<ShoppingCarts> {
  bool isEmpty;

  @override
  void initState() {
    super.initState();
    setState(() {
      isEmpty = true;
    });
  }

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
      body: isEmpty == false
          ? Center(
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
            )
          : ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      'Name Resturant',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pizza Salami',
                        ),
                        Text('\€ 19.50')
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                  color: Colors.grey[400],
                ),
                // ignore: deprecated_member_use
                FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'WARENKORB ANZEIGEN',
                        style: TextStyle(
                          color: Colors.redAccent[400],
                          fontSize: 13,
                        ),
                      ),
                    ))
              ],
            ),
    );
  }
}
