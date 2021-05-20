import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Widgets/listFoodGrupe.dart';
import 'package:mjam/bloc/Location_Bloc/firstLocation.dart';
import 'package:mjam/home_Screen_Tile/Bottom_Filter_Abholung_sort.dart';
import 'package:provider/provider.dart';
import '../Banner/Banr.dart';
import '../resturants/resturans_liste.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    DefultLocation userLocation = Provider.of<DefultLocation>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Sofort zu ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                        text: userLocation.location.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        )),
                  ])),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: greyLightColor,
                width: MediaQuery.of(context).size.width,
                height: 10,
              ),
              FoodGrupe(),
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
