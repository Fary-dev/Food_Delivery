import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class FoodGrupe extends StatefulWidget {
  @override
  _FoodGrupeState createState() => _FoodGrupeState();
}

class _FoodGrupeState extends State<FoodGrupe> {
  final Color disabelColor = Colors.grey[100];
  int selectIndex;

  Container foodTitle(String imageVal, String heading, int index,
      Color colorCategury, bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(2),
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imageVal),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      color: selectIndex == index && isActive == true
                          ? colorCategury
                          : disabelColor,
                      spreadRadius: 5,
                      blurRadius: 1),
                  BoxShadow(
                      offset: Offset(-1, -1),
                      color: selectIndex == index && isActive == true
                          ? colorCategury
                          : disabelColor,
                      spreadRadius: 5,
                      blurRadius: 1)
                ],
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                  onPressed: () {
                    selectIndex = index;

                    setState(() {});
                  },
                  child: null),
            ),
          ),
          Container(
            child: Text(
              heading,
              textAlign: TextAlign.center,
              style: TextStyle(letterSpacing: 0.5, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          reverse: false,
          children: <Widget>[
            foodTitle("assets/piz1.jpg", "Pizza", 0, Colors.green[100], true),
            foodTitle(
                "assets/ber1.jpg", "Burger", 1, Colors.redAccent[700], true),
            foodTitle("assets/sa1.jpg", "Salat", 2, Colors.green[500], true),
            foodTitle("assets/sp1.jpg", "Pasta", 3, Colors.lime[700], true),
            foodTitle(
                "assets/ke1.jpg", "Kebap", 4, Colors.redAccent[400], true),
            foodTitle("assets/Mehr.jpg", "Mehr", 5, Colors.green[700], true),
          ],
          addAutomaticKeepAlives: true,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
