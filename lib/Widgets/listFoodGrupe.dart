import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mjam/Contants/Color.dart';

// ignore: camel_case_types
class FoodGrupe extends StatefulWidget {
  @override
  _FoodGrupeState createState() => _FoodGrupeState();
}

class _FoodGrupeState extends State<FoodGrupe> {
  final Color disabelColor = greyLightColor;
  int selectIndex;

  foodTitle(String imageVal, String heading, int index, Color colorCategury,
      bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(3),
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
              child: MaterialButton(
                  onPressed: () {
                    selectIndex = index;

                    setState(() {});
                  },
                  child: null),
            ),
          ),
          SizedBox(
            height: 5,
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
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Center(
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
    );
  }
}
