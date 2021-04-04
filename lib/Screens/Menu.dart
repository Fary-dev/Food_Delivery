import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mjam/Widgets/listFoodGrupe.dart';
import 'package:mjam/home_Screen_Tile/Bottom_Filter_Abholung_sort.dart';
import 'package:mjam/resturants/resturans_liste.dart';
import '../Widgets/Banr.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Sofort zu",
              style: TextStyle(
                  color: Colors.black, fontSize: 13, letterSpacing: 0.5),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 7),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: FoodGrupe(),
              ),
              ////////////////___________________ Bottom  ____________////////////
              BottomFilterAbholungSort(),
              SizedBox(height: 5),
              ///////////////____________________ Banner _____________////////////
              Container(
                  padding: EdgeInsets.only(bottom: 0),
                  color: Colors.grey[100],
                  child: Banr()),

              //////______________________ Resturant List ____________////////////
              ResturantListe(),
            ],
          ),
        ),
      ),
    );
  }
}