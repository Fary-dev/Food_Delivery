import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class AusWahl extends StatefulWidget {
  AusWahl({Key key}) : super(key: key);
  @override
  _AusWahlState createState() => _AusWahlState();
}

class _AusWahlState extends State<AusWahl> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Sofort zu",
              style: TextStyle(
                  color: Colors.black, fontSize: 13, letterSpacing: 0.5),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent[100].withOpacity(1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.red[700],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Text('Essen',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Positioned(
                          top: 100,
                          left: 20,
                          child: Text('Burger,\nPizza, Salate...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Positioned(
                            top: 150,
                            left: 20,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 27,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              // padding: EdgeInsets.all(0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Jetzt bestellen',
                                    style: TextStyle(
                                        color: Colors.red[700], fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.red[700],
                                  )
                                ],
                              ),
                            )),
                        Positioned(
                          right: 0,
                          top: 50,
                          child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                'assets/Essen.png',
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                height: 185,
                width: 420,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  'assets/abholen.jpg',
                ))),
                // ignore: deprecated_member_use
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: null,
                ),
              ),
              Container(
                height: 140,
                width: 380,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/abholen.jpg'))),
                // ignore: deprecated_member_use
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
