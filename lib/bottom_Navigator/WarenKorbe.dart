import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mjam/Screens/HomePage.dart';

class WarenKorbe extends StatefulWidget {
  WarenKorbe({Key key}) : super(key: key);

  @override
  _WarenKorbeState createState() => _WarenKorbeState();
}

class _WarenKorbeState extends State<WarenKorbe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //margin: EdgeInsets.only(left: 105),

                child: Text(
                  "Deine Warenkörbe",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: CupertinoButton(
                  child: new Text(
                    "Ändern",
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.red[700], fontSize: 13),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )),
      body: Center(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
